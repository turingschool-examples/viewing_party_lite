# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing_page#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: %i[new create show] do
    resources :discover, only: [:index]
    resources :movies, only: [:index] do
      resources :viewing_party, only: %i[new create]
    end
  end
end
