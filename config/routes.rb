# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies/:movie_id', to: 'movies#show'
  get '/users/:user_id/movies', to: 'users#results'
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: "users#login_user"

  post '/users/:user_id/movies/:movie_id/viewing-party/', to: 'viewing_parties#create'
  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
  delete '/logout', to: 'users#logout_user'
  resources :users, only: %i[show new create] do
  end
end
