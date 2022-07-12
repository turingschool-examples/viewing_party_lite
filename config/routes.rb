# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/users/:user_id/movies/:movie_id/party/new', to: 'parties#new'

  post '/users/:user_id/movies/:movie_id/party/new', to: 'parties#create'

  resources :users, only: %i[index show] do
    resources :movies, only: %i[index show]
    resources :discover, only: [:index]
  end

  namespace :user, only: %i[index show], module: :user do
    resources :parties, only: %i[index show new create]
  end
end
