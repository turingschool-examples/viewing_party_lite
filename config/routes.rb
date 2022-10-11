Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  resources :users, only: [:new] do
    get '/dashboard', to: 'dashboard#show', as: :dashboard
    get '/discover', to: 'discover#index', as: :discover
  end
end
