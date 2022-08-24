Rails.application.routes.draw do
  get '/', to: "welcome#index"
  
  get "/users/:id/discover", to: "users#discover"
  resources :users, only: [:show]

end
