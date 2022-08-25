# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :create]

  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'movies#discover'
  get '/users/:id/movies/:movie_id', to: 'movies#show'
  get '/users/:id/movies', to: 'movies#results'
  post '/users/:id/movies', to: 'movies#results'
end
