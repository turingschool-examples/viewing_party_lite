# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  get '/register', to: 'users#new'
  #get '/users/:user_id/movies/:movie_id/viewing_party/new', to: 'users/viewing_party#new'

  resources :users, only: %i[create show] do
    resources :movies, only: %i[index show], controller: 'users/movies' do 
      resources :viewing_parties, only: %i[new create], controller: 'users/viewing_party'
    end

    member do
      get 'discover', to: 'users/discover#index'
    end
  end
end
