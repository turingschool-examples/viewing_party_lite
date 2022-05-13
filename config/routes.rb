# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing#index'

  get '/register', to: 'users#new'
  post '/users/:id', to: 'viewing_parties#create'

  resources :users, only: %i[show create] do
    resources :movies, only: %i[index show] do
      resources :viewing_parties, only: [:new]
    end
    resources :discover, only: [:index]
  end
end
