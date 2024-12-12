Rails.application.routes.draw do
  root to: "home#index"
  get "services", to: "home#services"
  devise_for :users
vamos
  # Rotas para pedidos (não precisando do show, só create e destroy)
  resources :pedidos, only: [:create, :destroy] do
    member do
      # Ação para exibir o cupom relacionado ao pedido
      get 'cupom'
    end
  end
  # Namespace para o painel administrativo (admin)
  namespace :admin do
    root to: "dashboard#index"

    resources :users, except: [:show]
    resources :services
    resources :rodas, except: [:show]
    resources :vendas, only: [:index, :new, :create]
    resources :reservas, only: [:index, :destroy]
  end
end
