Rails.application.routes.draw do
  root 'landing#index'
  
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  
  resources :users do
    resources :discover
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
