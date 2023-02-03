# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, except: [:new] do
    member do
      get 'discover', to: 'users/discover#index'
    end
    resources :movies, only: %i[index show], controller: 'users/movies' do
      resources :viewing_parties, only: %i[new create], controller: 'users/viewing_parties'
    end
  end
end
