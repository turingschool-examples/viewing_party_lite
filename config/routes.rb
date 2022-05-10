Rails.application.routes.draw do
  get "/", to: "welcome#index"

  resources :users, only: [:show, :new, :create] do
    resources :discover, only: [:index], controller: "movies"
  end
end
