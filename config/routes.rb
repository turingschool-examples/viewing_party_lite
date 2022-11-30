# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  resources :users do
    resources :discover, only: [:index]
  end

  resources :register, only: [:new, :create], controller: "users"
end
