Rails.application.routes.draw do
  resources :gossip
  resources :users
  resources :city, only: [:show]
  resources :sessions

  root 'gossip#index'
  get '/contact', to: 'contact#contact'
  get '/equipe', to: 'team#team'

end
