# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/register', to: 'users#new'

  resources :users, only: %i[show create] do
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end

  get '/users/:id/discover', to: 'movies#index'
  # get '/users/:id/movies/:id/viewing-party/new', to: 'parties#new'
end
