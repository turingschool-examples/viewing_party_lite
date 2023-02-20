# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users, only: [:create]

  resources :movies, only: [:show] do
    resources :viewing_parties, only: %i[new create]
  end

  root 'landing#index'

  get '/discover', to: 'users#discover_movies'
  get '/movies', to: 'user_movies#details'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/logout', to: 'users#logout'

  get '/dashboard', to: "users#show"
  get '/movies', to: 'movies#show'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    get '/users/:id', to: 'dashboard#show'
  end
end
