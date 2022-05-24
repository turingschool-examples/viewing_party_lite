Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get "/register", to: "users#new"
  get "/dashboard", to: "users#show"
  post "/users", to: "users#create"

  get "/users/:id/discover", to: "movies#index"
  get "/users/:id/movies", to: "movies#results"
  get "/users/:user_id/movies/:id", to: "movies#show"

  get "/users/:user_id/movies/:movie_id/viewing_party/new", to: "parties#new"
  post "/users/:user_id/movies/:movie_id/viewing_party", to: "parties#create"

end
