Rails.application.routes.draw do
  get '/register', to: 'register#new'
  post '/register', to: 'register#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies/index', to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home_page#index'
   resources :users do
     resources :movies
   end
   resources :register
   resources :viewing_parties
end
