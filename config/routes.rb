Rails.application.routes.draw do
  get "/", to: "welcome#index"

  # resources :user, only: [:show]
  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/users/:id/discover", to: "users#discover"
  get "/users/:id/movies", to: "users#movies"
  post "/users/:id/movies", to: "users#movies"
  get "/users/:id/movies/:movie_id", to: "users#movie_show"

end
