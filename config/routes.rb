Rails.application.routes.draw do
  root "landings#index"

  resources :users 
  get "/register", to: "users#new"

end
