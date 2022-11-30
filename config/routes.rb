# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies', to: 'users#results'
  get '/register', to: 'users#new'
  resources :users, only: %i[show new create] do
  end
end
