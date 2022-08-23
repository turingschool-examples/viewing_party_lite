Rails.application.routes.draw do
  get "/", to: 'users#landing'
  get "/register", to: 'users#register'
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/discover', to: 'users#discover'
  resources :parties, only: [:index]
end
