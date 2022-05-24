# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#create'

  # post '/dashboard', to: 'users#show'
  get '/dashboard', to: 'users#show'
  
  get '/movies', to: 'user_movies#index'
  get '/movies/:movie_id', to: 'user_movies#show'
  get '/movies/:movie_id/party/new', to: 'user_movie_parties#new'
  post '/movies/:movie_id/party/new', to: 'user_movie_parties#create'
  get '/discover', to: 'users#discover'
  
  resources :users, only: %i[new create]

  # get '/users/:id', to: 'users#show'
  # get '/user'
end
