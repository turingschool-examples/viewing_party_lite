# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homepage#index'

  get '/register', to: 'user#new'
  get '/login', to: 'user#login_form'
  post '/login', to: 'user#login'

  resources :user, only: %i[show create] do
    resources :discover, only: [:index]
    resources :movie, only: %i[index show] do
      resources :viewing_party, only: %i[new create]
    end
  end
end
