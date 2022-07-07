Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/users/:id/discover', to: "users#discover"
  resources :users, only: [:index, :show, :create]

  get '/register', to: "users#new"
end
