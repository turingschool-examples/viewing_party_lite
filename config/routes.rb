# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'users#discover'

  resources :users, only: %i[show create]
end
