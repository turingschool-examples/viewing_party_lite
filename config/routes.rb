# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "landing#home"

  resources :users, except: [:new]
  resources :parties

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  # get '/admin', to: 'admins#dashboard'
end
