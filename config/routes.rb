Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "landing#index"

  resources :users, only: [:show] do
    resources :movies, only: [:show]
    get "/discover", to: "discover#search"
  end
end
