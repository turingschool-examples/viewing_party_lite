# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homepage#index"

  get '/register', to: 'user#new' 

  resources :user, only: [:show, :create] do
  end
end
