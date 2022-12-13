# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User Routes
  resources :users, only: %i[create]
  get '/dashboard', to: 'users#show'
  get '/', to: 'users#index'
  get '/register', to: 'users#new'

  #Admin Routes
  get '/admin/dashboard', to: 'admin#show'
  namespace :admin do 
    resources :users, only: %i[show]
  end

  # Movie Discover
  resources :discover, only: [:index]

  # Movie and Viewing Parties
  resources :movies, only: %i[index show] do
    resources :viewing_parties, only: %i[new create]
  end

  # Login Routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
