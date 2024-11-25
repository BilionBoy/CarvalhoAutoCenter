Rails.application.routes.draw do
  root to: 'home#index'
  get 'about', to: 'home#about'
  get 'services', to: 'home#services'
  get 'contact', to: 'home#contact'

  # Rotas do Devise
  devise_for :users

  # Rotas administrativas
  namespace :admin do
    root to: 'dashboard#index' 
    resources :users 
    resources :services 
  end
end
