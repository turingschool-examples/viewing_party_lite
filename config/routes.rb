# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'
  get '/users/:id', to: 'users#show'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
end
