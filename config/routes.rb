# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/', to: 'welcome#index'

  get '/users', to: 'users#index'
  get '/register', to: 'users#new'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'  
end
