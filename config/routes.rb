Rails.application.routes.draw do
  resources :gossip
  resources :user
  resources :city, only: [:show]

  root 'gossip#index'
  get '/contact', to: 'contact#contact'
  get '/equipe', to: 'team#team'

end
