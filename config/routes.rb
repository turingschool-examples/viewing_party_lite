Rails.application.routes.draw do

  root to: 'users#welcome'
  get '/register', to: 'users#new'

  resources :user_parties
  resources :parties
  resources :users
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies', to: 'users#results'
end
