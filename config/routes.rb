# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users, only: [:create, :show] do 
    resources :movies, only: [:show]
  end
  get "/register", to: "users#new"
  get "/users/:id/discover", to: "movies#discover"
  get "/users/:id/movies", to: "movies#index"
  
  get '/', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
