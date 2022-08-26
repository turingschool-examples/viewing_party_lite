Rails.application.routes.draw do

  get '/', to: 'landing#index'
  get '/register', to: "users#new"
  post '/register', to: "users#create"
  # get '/users/:id/movies/:movie_id', to: "movies#show" 
  # post '/users/:id/movies/:movie_id', to: "movies#show"
  get '/users/:id/discover', to: "users#discover"
  resources :users, only: [:new, :create, :show] do 
    resources :movies, only: [:index, :show] do resources :viewing_party, only: [:index, :show, :create, :new]
    end
  end
end

# root 'landing#index'
