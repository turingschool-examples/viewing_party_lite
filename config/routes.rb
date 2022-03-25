Rails.application.routes.draw do
  root 'landing_page#index'

  get '/register', to: 'users#new'

  resources :users, only: %i[show create] do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show]
  end
end
