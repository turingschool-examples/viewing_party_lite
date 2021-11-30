Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: :create

  get '/users/:user_id', to: 'users#show', as: 'dashboard'
  get '/registration', to: 'users#new', as: 'registration'

  resources :discover, only: :index
end
