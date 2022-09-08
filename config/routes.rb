Rails.application.routes.draw do

  get '/', to: 'landing#index'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/register', to: "users#new"
  post '/register', to: "users#create"
  get '/users/:id/discover', to: "users#discover"
  get '/dashboard', to: "dashboard#index"
  resources :users, only: [:new, :create, :show] do 
    resources :movies, only: [:index, :show] do 
      resources :viewing_party, only: [:index, :show, :create, :new]
    end
  end
end

