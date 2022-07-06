# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "landing#home"

  resources :users
  resources :parties
  # get '/admin', to: 'admins#dashboard'
end
