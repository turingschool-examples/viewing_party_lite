# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :create]

  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'movies#discover'
end
