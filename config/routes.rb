Rails.application.routes.draw do
  root to: "home#index"
  get "services", to: "home#services"

  # Rotas do Devise
  devise_for :users

  # Rotas administrativas
  namespace :admin do
    get "rodas/index"
    get "rodas/new"
    get "rodas/create"
    get "rodas/edit"
    get "rodas/update"
    get "rodas/destroy"

    root to: "dashboard#index"
    resources :users
    resources :services
    resources :rodas
    resources :rodas, only: [:index]

  end
end
