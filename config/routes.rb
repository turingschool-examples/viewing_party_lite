Rails.application.routes.draw do
  root "landing#index"

  resources :users 
  get "/register", to: "users#new"

end
