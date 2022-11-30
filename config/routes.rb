Rails.application.routes.draw do
  root "landings#index"

  resources :users do 
    resources :discover, only: [:index]
  end
  get '/register', to: 'users#new'
  
end
