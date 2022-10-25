Rails.application.routes.draw do

  root to: 'users#welcome'
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/dashboard', to: 'users#show'

  resources :user_parties
  resources :parties
  resources :users, only: [:create, :new]
  get '/users/discover', to: 'users#discover'
  get '/users/movies/:movie_id', to: 'movies#show'
  get '/users/movies', to: 'users#results'
  get '/users/movies/:movie_id/viewing-party/new', to: 'user_parties#new'
  post '/users/movies/:movie_id/create', to: 'user_parties#create'
end
