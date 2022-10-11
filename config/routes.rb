Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'landings#index' is the same?
  root 'landings#index'

  resources :users, only: [:show, :create], path: 'dashboard'
  resources :users, only: :new, path: 'register'
end
