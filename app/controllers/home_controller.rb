class HomeController < ApplicationController
  def index
  end
  def services
    @q = Roda.ransack(params[:q])  # Inicializa a busca
    @rodas = @q.result(distinct: true)  # Executa a pesquisa, se houver
    @no_results = @rodas.empty?  # Verifica se não há resultados
  end
  

  def up
    render json: { status: "UP", time: Time.now }, status: :ok
  end

end