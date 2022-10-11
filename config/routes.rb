Rails.application.routes.draw do

  root to: 'users#welcome'
  get '/register', to: 'users#new'

  resources :user_parties
  resources :parties
  resources :users
end
