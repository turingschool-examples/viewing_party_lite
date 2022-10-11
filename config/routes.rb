Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :landing, only: [:index]

  get '/', to: 'landing#index'

  resources :users, only: [:new]
end
