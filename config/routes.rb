Rails.application.routes.draw do

  root to: 'landing#index'
 
  get '/register', to: 'users#register'

  resources :users, only: [:create, :show]


end
