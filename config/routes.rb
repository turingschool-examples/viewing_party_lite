Rails.application.routes.draw do
  root 'welcome#index'
  get "/register", to: "users#new"
  resources :users, only: [:index, :new, :create, :show] do
    resources :discover, only: [:index]
  end

end
