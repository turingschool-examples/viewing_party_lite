# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  get "/register", to: "users#new"
  get "/users/:id/discover", to: "movies#discover"
end
