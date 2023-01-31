Rails.application.routes.draw do
  resources :welcome, only: [:index]
  # namespace :users do
  #   resources :dashboard, only: [:show, :new, :create]
  #   resources :movies, only: [:index]
  # end

  get '/users/:id/discover', to: 'users/discover#index', as: 'users_discover_index'

  get '/users/dashboard/new', to: 'users/dashboard#new', as: 'new_users_dashboard'
  get '/users/:id/dashboard', to: 'users/dashboard#show', as: 'users_dashboard'
  post '/users/dashboard', to: 'users/dashboard#create', as: 'users_dashboard_create'


  get '/users/:id/movies', to: 'users/movies#index', as: 'movie_results'
end
