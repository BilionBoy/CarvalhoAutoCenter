# syntax = docker/dockerfile:1

# Certifique-se de que a versão do Ruby seja compatível com a versão no .ruby-version e Gemfile
ARG RUBY_VERSION=3.3.3
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Diretório onde a aplicação Rails será copiada
WORKDIR /rails

# Definir ambiente de produção
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Estágio de build (reduz o tamanho da imagem final)
FROM base as build

# Instalar pacotes necessários para compilar gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Instalar as gems da aplicação
COPY Gemfile Gemfile.lock ./
RUN bundle update net-pop && \
    bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Instalar bibliotecas adicionais que podem ser necessárias
RUN apt-get update && apt-get install -y libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Copiar o código da aplicação para o contêiner
COPY . .

# Pré-compilar os arquivos do Bootsnap para inicialização mais rápida
RUN bundle exec bootsnap precompile app/ lib/

# Pré-compilar os assets da aplicação (sem precisar da chave secreta RAILS_MASTER_KEY)
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Estágio final para a imagem da aplicação
FROM base

# Instalar pacotes necessários para rodar a aplicação em produção
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libvips postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# Copiar artefatos gerados do estágio de build para a imagem final
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Criar o usuário 'rails' para maior segurança e alterar permissões
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp /rails

# Definir o usuário para execução da aplicação (não root)
USER rails:rails

# Garantir que o script de entrada tenha permissões de execução
RUN chmod +x /rails/bin/docker-entrypoint

# Definir o ponto de entrada (entrypoint) da aplicação
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expor a porta 3000 para a aplicação Rails
EXPOSE 3000

# Comando padrão para rodar a aplicação Rails
CMD ["./bin/rails", "server"]
