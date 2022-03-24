# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  resources :users, only: [:index, :show]

  namespace :user, only: [:index, :show], module: :user do
    resources :parties, only: [:index, :show, :new, :create]
 end
end
