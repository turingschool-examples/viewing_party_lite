Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'

  get '/users/:id/discover', to: 'users#discover_movies'
  get '/users/:id/movies', to: 'user_movies#details'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  resources :users, only: [:create, :show] 
end