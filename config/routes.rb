# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/users/:user_id/movies/:movie_id/party/new', to: 'parties#new'

  post '/users/:user_id/movies/:movie_id/party/new', to: 'parties#create'

  resources :users, only: [:index, :show] do
    resources :movies, only: [:index, :show]
    resources :discover, only: [:index]
  end


  namespace :user, only: [:index, :show], module: :user do
    resources :parties, only: [:index, :show, :new, :create]

 end
end
