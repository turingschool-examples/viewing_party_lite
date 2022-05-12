Rails.application.routes.draw do

  get '/', to: 'landing#index'

  

  get '/register', to: 'users#new'

  resources :users, only: [:create, :show] do
    get '/dashboard', to: 'users#show'
    post '/dashboard', to: 'users#show'
    get '/discover', to: 'users#discover'
    resources :movies, only: [:index, :show]
  end
end
