Rails.application.routes.draw do
  root "landings#index"

  resources :users do 
    resources :discovers, only: [:index]
  end
  get '/register', to: 'users#new'
  
end
