# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'

  get '/register', to: 'users#new'

  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'

  post '/users', to: 'users#create'

  get '/users/:id/movies/:movie_id', to: 'user_movies#show'
  get '/users/:id/movies/:movie_id', to: 'user_movies#show'
  get '/users/:id/movies', to: 'user_movies#index'

  resources :users do
    resources :movies do
      resources :viewing_parties, only: [:new, :create]
    end
  end
end
