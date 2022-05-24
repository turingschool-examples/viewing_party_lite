Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/dashboard", to: "users#show"
  get "/discover", to: "movies#index"
  get "/movies/:id", to: "movies#show"
  get "/movies/:id/parties/new", to: "parties#new"
  post "/movies/:id/parties", to: "parties#create"

  # resources :users, only: [:show, :new, :create] do
  #   resources :discover, only: [:index], controller: "movies"
  #   resources :movies, only: [:show] do
  #     resources :parties, only: [:new, :create]
  #   end
  # end
end
