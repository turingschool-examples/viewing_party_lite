Rails.application.routes.draw do
  resources :users do 
    resources :movies, only: [:show]
  end
end
