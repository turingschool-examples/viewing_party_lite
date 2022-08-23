# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :show]

  get '/register', to: 'users#new'
end
