Rails.application.routes.draw do
  root 'landing_page#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index]
  end

end
