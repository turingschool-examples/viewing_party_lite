# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/users/:id/discover', to: 'users#discover'
  resources :users, only: %i[new index show create] do
    resources :movies, only: %i[index show] do
    end
  end

  get '/register', to: 'users#new'
end
