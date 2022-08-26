# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :create]

  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'movies#discover'
  get '/users/:id/movies/:movie_id', to: 'movies#show'

  get '/users/:id/movies', to: 'movies#results'
  post '/users/:id/movies', to: 'movies#results'

  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
  post '/users/:user_id/movies/:movie_id/viewing-party', to: 'viewing_parties#create'

end
