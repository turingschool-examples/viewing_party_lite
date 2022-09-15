# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'welcome#index'
  root to: 'welcome#index'

  get '/users', to: 'users#index'
  get '/register', to: 'users#new'
  # get '/users/:id', to: 'users#show'
  get '/dashboard', to: 'users#show'

  post '/users', to: 'users#create' 
  get '/movies', to: 'movies#results'
  get '/discover', to: 'users#discover'

  # get '/login', to: 'users#login_form'
  # post '/login', to: 'users#login_user'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get'/logout', to: 'sessions#destroy'

end
