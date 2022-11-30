Rails.application.routes.draw do
  root to: 'landing_page#index'

  resources :users, only: [:show, :new]
end
