Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/discover', to: 'users#discover'
  resources :parties, only: [:index]
end
