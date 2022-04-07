Rails.application.routes.draw do
  root 'landing_page#index'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/register', to: 'users#new'
  resources :users, only: %i[show create] do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end
end
