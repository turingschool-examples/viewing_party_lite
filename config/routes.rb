Rails.application.routes.draw do
  get '/register', to: 'register#new'
  post '/register', to: 'register#create'
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home_page#index'
   resources :users
   resources :register
end
