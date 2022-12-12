# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'users#login'

  get '/register', to: 'users#new'

  get '/users/:id/discover', to: 'users#discover'

  resources :users, only: %i[show create] do
    resources :movies, only: %i[index show] do
      resources :view_parties, only: %i[new create]
    end
  end
end
