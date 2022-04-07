# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  # get '/users/new', to: 'users#new'
  get '/register', to: 'users#new'
  post '/search', to: 'movies#search'
  # post '/users', to: 'users#create'
  resources :users, only: %i[create show] do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end
end
