Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/register", to: "users#new", as: :register
  resources :users, only: [:new, :show, :create] do
    get "/discover", to: "movies#discover", as: :discover
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new, :create]
    end
  end
end
