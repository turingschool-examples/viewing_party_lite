# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id/discover', to: 'users#discover'
  resources :users do
    resources :movies, only: [:index, :show] do 
      resources :viewing_parties, only: [:new, :index]
    end
  end
    post '/users/:user_id/movies/:movie_id/viewing_parties/new', to: 'viewing_parties#create'
end
