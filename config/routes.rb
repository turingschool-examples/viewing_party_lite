Rails.application.routes.draw do
  get "/", to: "landing#index"

  resources :users
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get "users/:id/discover", to: 'movie#index'
end
