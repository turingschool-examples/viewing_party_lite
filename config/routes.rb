Rails.application.routes.draw do

  root to: 'landing#index'
 
  get '/register', to: 'users#register'
  get 'users/:id/discover', to: 'users#discover'

  resources :users, only: [:create, :show], module: 'user' do
    resources :movies, only: [:index]
  end

end
