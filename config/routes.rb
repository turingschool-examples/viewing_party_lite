Rails.application.routes.draw do
  
  root to: 'landing#index'

  resources :users, only: [:show]

end
