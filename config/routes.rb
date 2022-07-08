Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'users#discover'
  resources :users, only: [:show, :create] do 
    resources :movies, only: [:index]
  end 
end
