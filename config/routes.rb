Rails.application.routes.draw do
  resources :welcome, only: [:index]

  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
    resources :movies, only: [:index, :show]
    resources :discover, only: [:index]
  end
  
end
