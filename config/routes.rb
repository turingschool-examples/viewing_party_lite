# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#new'

  resources :users do
    # shallow_path: '/register', shallow: true do
    # get'/register', to: 'users#new', shallow: true
    # post '/register', to: 'users#new', shallow: true
    get '/discover', to: 'movies#discover'
    resources :movies do
      resources :viewing_parties
    end
  end
  # get '/register', to: 'users#index'
end
