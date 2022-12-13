# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  resources :users do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new, :create]
    end
  end

  resources :register, only: [:new, :create], controller: "users"

  get "/login", to: "users#login_form"
  post '/login', to: 'users#login_user'
end
