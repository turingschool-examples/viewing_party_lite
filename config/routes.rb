Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing_page#index'

  get '/register', to: 'users#new', as: 'register'

  resources :users, only: [:create, :show] do
    # resources :discover, only: index
    resources :movies, only: [:index, :show]
  end


  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
  # get '/users/:user_id/movies', to: 'movies#index'
end
