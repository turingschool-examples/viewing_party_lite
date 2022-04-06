Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  
  get '/login', to: 'users#login'
  post '/login', to: 'users#authenticate_user'
  delete '/login', to: 'users#logout'

  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies/:id/viewing_party/new', to: 'viewing_party#new'
  post '/users/:user_id/movies/:id/viewing_party/new', to: 'viewing_party#create'


  resources :users, only: [:show, :new, :create] do
    resources :movies, only: [:index, :show], controller: :users_movies
      # resources :parties, controller: :viewing_party
  end
end
