# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create show] do
    resources :movies, only: [:show] do
      resources :viewing_parties, only: %i[new create]
    end
  end

  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show'

  get '/users/:id/discover', to: 'movies#discover'
  get '/users/:id/movies', to: 'movies#index'

  get '/', to: 'welcome#index'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get "/logout", to: "users#logout_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
