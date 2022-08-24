Rails.application.routes.draw do
  get "/", to: 'users#landing'
  get "/register", to: 'users#register'
  get "/users/new", to: 'users#new'
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/discover', to: 'users#discover'
  get '/users/:user_id/movies', to: 'users_movies#index'
  get '/users/:user_id/movies/:movie_id', to: 'users_movies#show'
  resources :parties, only: [:index]
end
