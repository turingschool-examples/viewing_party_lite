Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'users#index'
  get '/register', to: 'users#new'

  resources :users, only: [:create, :show]
end
