# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  get '/discover', to: 'users#discover'
  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'

  get '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show'

  post '/viewing_parties', to: 'viewing_parties#create'
  get '/movies/:movie_id/viewing_party/new', to: 'viewing_parties#new'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    resources :users, only: %i[show]
  end
end
