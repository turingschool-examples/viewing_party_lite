# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i[show create] do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :viewing_parties, only: %i[new create]
    end
  end

  get '/', to: 'users#index'
  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
