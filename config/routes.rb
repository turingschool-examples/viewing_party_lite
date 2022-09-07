# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  resources :users, only: %i[show create] do
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end

  get '/users/:user_id/discover', to: 'movies#discover'
  # get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'parties#new'
end
