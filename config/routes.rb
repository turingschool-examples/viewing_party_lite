# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  resources :users

  resources :register, only: [:new, :create], controller: "users"
end
