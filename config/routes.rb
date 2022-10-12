Rails.application.routes.draw do

  root to: 'users#welcome'
  get '/register', to: 'users#new'

  resources :user_parties
  resources :parties
  resources :users
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies/:movie_id', to: 'movies#show'
  get '/users/:id/movies', to: 'users#results'
  get '/users/:id/movies/:movie_id/viewing-party/new', to: 'user_parties#new'
  post '/users/:id/movies/:movie_id', to: 'user_parties#create'
end
