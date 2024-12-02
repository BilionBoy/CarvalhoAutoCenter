Rails.application.routes.draw do
  root to: "home#index"
  get "services", to: "home#services"

  # Rotas do Devise
  devise_for :users

  # Rotas administrativas
  namespace :admin do
    root to: "dashboard#index"

    resources :users
    resources :services
    resources :rodas, except: [:show]
  end
end
