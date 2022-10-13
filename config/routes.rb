Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  resources :users, only: [:create, :show] do
    get '/discover', to: 'users#discover'
    resources :movies, only: [:index, :show]
  end
  
  get '/register', to: 'users#new'
end
