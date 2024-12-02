Rails.application.routes.draw do
  root to: "home#index"
  get "services", to: "home#services"

  # Rotas do Devise
  devise_for :users

  # Rotas administrativas
  namespace :admin do
    root to: "dashboard#index"  # Página inicial do painel administrativo

    resources :users, except: [:show]   # Roteamento para gerenciamento de usuários, sem a ação 'show'
    resources :services
    resources :rodas, except: [:show]   # Roteamento para gerenciamento de rodas
  end
end
