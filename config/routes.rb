# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/users/:id/discover', to: 'users#discover'
  get '/register', to: 'users#new'
  post '/users/:id/search', to: 'movies#index'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  resources :users, only: %i[show new create] do
    resources :movies, only: %i[show index] do
      resources :view_parties, only: %i[new create]
    end
  end
end
