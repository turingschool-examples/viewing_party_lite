Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"
  resources :users do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
  end
  post '/users/:user_id/movies/:movie_id/viewing_party', to: 'viewing_party#create'
  get '/users/:user_id/movies/:movie_id/viewing_party/new', to: 'viewing_party#new'
  post '/users/new', to: 'users#create'
end
