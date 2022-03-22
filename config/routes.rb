Rails.application.routes.draw do
  get "/", to: "welcome#index"

  resources :user, only: [:new, :create, :show]
end
