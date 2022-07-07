Rails.application.routes.draw do
  
  resources :users

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
