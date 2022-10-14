Rails.application.routes.draw do

  root to: 'landing#index'
 
  get '/register', to: 'users#register'
  get 'users/:id/discover', to: 'users#discover'

  resources :users, only: [:create, :show] do #, module: 'user' 
    resources :movies, only: [:index]
  end

end
