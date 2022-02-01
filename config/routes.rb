# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homepage#index"

  post '/register', to: 'user#create' 

  resources :user, only: [:show] do
  end
  # get '/user/:id', to: 'user#show' 
end
