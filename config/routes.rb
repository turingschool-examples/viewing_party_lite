Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'

  get '/login', to: 'users#login'
  post '/login', to: 'users#authenticate_user'
  delete '/login', to: 'users#logout'

  get '/discover', to: 'users#discover'
  get '/movies/:id/viewing_party/new', to: 'viewing_party#new'
  post 'movies/:id/viewing_party/new', to: 'viewing_party#create'

  get '/dashboard', to: 'users#show'
  

  resources :users, only: [:new, :create]
  resources :movies, only: [:index, :show], controller: :users_movies
      # resources :parties, controller: :viewing_party
  # end


end
