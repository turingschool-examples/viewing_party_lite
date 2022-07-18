# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#home'

  resources :users, except: [:new]
  resources :parties

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  # get '/admin', to: 'admins#dashboard'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies', to: 'users#movies'
  get '/users/:id/movies/:movie_id', to: 'users#movie_details'
  get '/users/:id/movies/:movie_id/viewing-party/new', to: 'parties#new'
  post '/users/:id/viewing-party/dashboard', to: 'parties#create'

  get '/users/:id/viewing-party/dashboard', to: 'parties#dashboard'
end
