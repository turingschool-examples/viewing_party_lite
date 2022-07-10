# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
  get '/register', to: 'users#new'
  get '/users/:id/movies', to: 'movies#index'
  get 'users/:user_id/movies/:movie_id/show', to: 'movies#show'
  post '/register', to: 'users#create'
  get 'users/:user_id/movies/:movie_id/viewing_party/new', to: 'parties#new'
  post 'users/:user_id/movies/:movie_id/viewing_party', to: 'parties#create'
end
