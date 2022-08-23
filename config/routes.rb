Rails.application.routes.draw do

  resources :users, only: [:show]


  get "/", to: 'users#landing'
  get "/register", to: 'users#register'
end
