Rails.application.routes.draw do
  root 'landing#index'

  get '/', to: 'landing#index'
  
  resources :users, only: [:show, :new, :create]
  
end
