Rails.application.routes.draw do
  # get 'movies/index'
  # get 'movies/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  resources :users, only: %i[index show new create] do
    resources :discover, only: %i[index]
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end

  get '/users/:user_id', to: 'users#show'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  # namespace :admin do
  #   get '/dashboard', to: 'dashboard#index'
  # end

end
