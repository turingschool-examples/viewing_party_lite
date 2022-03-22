# frozen_string_literal: true

Rails.application.routes.draw do
   get '/', to: 'landings#index'
   get '/register', to: 'users#new'
   post '/register', to: 'users#create'
   post '/users', to: 'users#create'
   get '/users/:id', to: 'users#show'
end

