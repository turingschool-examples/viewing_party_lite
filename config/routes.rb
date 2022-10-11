Rails.application.routes.draw do

  root to: 'users#welcome'
  
  resources :user_parties
  resources :parties
  resources :users
end
