# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing_page#index'
  
  resources :users, only: [:show, :create] do

  end

  get '/register', to: 'users#new'
end
