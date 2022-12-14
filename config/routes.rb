# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/logout', to: 'users#logout_user'
  
  get '/discover', to: 'users#discover'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/dashboard', to: 'users#show'

  resources :users, only: %i[create]

  resources :movies, except: %i[index create new edit show update destroy] do
    resources :view_parties, only: %i[new create]
  end

  namespace :admin do
    resources :dashboard, only: %i[index show]
  end
end
