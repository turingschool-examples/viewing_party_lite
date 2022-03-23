# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'landing_page#index'
  # can use root path resource

  resources :users, only: [:create, :show]

  get '/users/:id/discover', to: 'user_movies#discover'

  get '/register', to: 'users#new'
end
