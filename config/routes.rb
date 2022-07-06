Rails.application.routes.draw do
  get "/", to: "landing#index"
  get "/register", to: "users#new"
  get "/users/:id", to: "users#show"
end
