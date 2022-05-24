Rails.application.routes.draw do
  get "/", to: "welcome#index"

  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/dashboard", to: "users#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get "/discover", to: "movies#index"
  get "/movies/:id", to: "movies#show"

  get "/movies/:id/parties/new", to: "parties#new"
  post "/movies/:id/parties", to: "parties#create"
end
