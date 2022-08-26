Rails.application.routes.draw do
  get '/', to: "welcome#index"  
  get "/users/:id/discover", to: "users#discover"
  post '/users/:id/search', to: 'movies#index'

  resources :users, only: [:show, :new, :create] do
    resources :movies, only: [:show, :index] do
      resources :view_parties, only: [:new, :create]
    end
  end
end
