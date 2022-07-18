Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
   resources :users, only: [:show, :create] do
      resources :discover, only: [:index]
      resources :movies, only: [:index, :show] do
        resources :viewing_party, only: [:new, :create]
      end
   end
   get '/register', to: 'users#new'
   get '/login', to: 'users#login_form'
   post '/login', to: 'users#login_user'
end
