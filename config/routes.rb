# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  get '/users/:id/discover', to: 'users#index'

  resources :users, only: %i[show create] do
    resources :movies, only: %i[index show] do
      resources :viewing_party, only: %i[new]
    end
  end
end
