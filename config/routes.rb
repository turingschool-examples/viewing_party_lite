# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'

  get '/users/:id/discover', to: 'users#discover_movies'
  get '/users/:id/movies', to: 'user_movies#details'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/logout', to: 'users#logout'

  get '/dashboard', to: "users#show"
  get '/movies', to: 'movies#show'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  # get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'

  resources :users, only: %i[create show] do
    resources :movies, only: [:show] do
      resources :viewing_parties, only: %i[new create]
    end
  end
end
