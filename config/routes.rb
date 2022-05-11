Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'

  resources :users, only: [:create, :show] do
    get '/dashboard', to: 'users#show'
    post '/dashboard', to: 'users#show'
    get '/discover', to: 'users#discover'
    resources :movies, only: [:index, :show]
  end
end
