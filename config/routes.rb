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

  resources :users, only: %i[create] do
    resources :movies, only: %i[show] do
      resources :view_parties, only: %i[new create]
    end
  end
end
