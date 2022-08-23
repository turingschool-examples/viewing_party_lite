Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'landing#index'

  resources :users, only: [:show]
  get '/users/:id/discover', to: 'discover#show'
end
