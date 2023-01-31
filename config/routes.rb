Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  # resources :users, only: [:new]
  get "/register", to: "users#new"
end
