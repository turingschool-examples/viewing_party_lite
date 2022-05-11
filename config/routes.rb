Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "landing_page#main"

  post "/register", to: "users#create"

  get "/users/:id", to: "users#dashboard"
end
