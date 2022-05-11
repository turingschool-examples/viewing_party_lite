Rails.application.routes.draw do
  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/users/:id", to: "users#show"
  get "/users/:id/discover", to: "users#discover"
end
