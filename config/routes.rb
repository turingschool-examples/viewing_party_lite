Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/register', to: 'users#new'
  # post '/users', to: 'users#create'

  resources :users, only: %i[show create]
  get 'register' => 'users#new'

  resources :movies, only: :index
end
