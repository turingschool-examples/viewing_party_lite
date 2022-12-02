# frozen_string_literal: true

Rails.application.routes.draw do
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/movies', to: 'movies#index'
  get '/', to: 'pages#home'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies/:id', to: 'movies#show'

  get '/users/:user_id/movies/:id/viewing-party/new', to: 'parties#new'
  post '/users/:user_id/movies/:id/viewing-party/new', to: 'parties#create'
end
