Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show'
  get '/users/:user_id/movies/:id/viewing_party/new', to: 'viewing_party#new'
  post '/users/:user_id/movies/:id/viewing_party', to: 'viewing_party#create'

  # get '/users/:user_id/movies', to: 'movies#index'

  resources :users, only: [:create, :new, :show] do
    resources :discover, only: [:index]
    resources :movies 
  end
end
