Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'home#about'
  get 'services', to: 'home#services'
  get '/up', to: "home#up"
end
