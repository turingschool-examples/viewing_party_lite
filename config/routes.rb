Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index"
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get '/logout', to: 'users#logout'

  resources :users, only: [:create] do
    resources :dashboard, only: [:show], controller: :users 
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :parties, only: [:new, :create]
    end
  end

  get '/users/:id', to: 'users#show'
end
