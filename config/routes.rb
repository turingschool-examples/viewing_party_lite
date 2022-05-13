Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :people, only: [:new, :create, :show, :index]
  # post "/register", to: "people#create", as: "poople"
  get "/discover", to: "movies#discover", as: "discover"

  resources :movies, only: [:index, :show]
end
