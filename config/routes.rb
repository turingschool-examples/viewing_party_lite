# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'

  get '/register', to: 'users#new'

  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies', to: 'users#movies'

  get '/users/:id/movies/:movie_id', to: 'user_movies#show'  

  post '/users', to: 'users#create'
end
