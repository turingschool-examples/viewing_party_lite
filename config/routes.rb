Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [] do
    get '/dashboard', to: 'dashboard#show', as: :dashboard
    get '/discover', to: 'discover#index', as: :discover
    resources :movies, only: [:index]
  end
end
