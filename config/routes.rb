Rails.application.routes.draw do

  root to: 'landing#index'
 
  get '/register', to: 'users#register'
  get 'users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies/:movie_id', to: 'user_movies#show' #namespace?

  resources :users, only: [:create, :show]


end
