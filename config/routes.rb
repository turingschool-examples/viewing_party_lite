Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
   resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
   end
   get '/register', to: 'users#new'
end
