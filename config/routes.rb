Rails.application.routes.draw do
  get '/', to: 'landing#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show]
end
