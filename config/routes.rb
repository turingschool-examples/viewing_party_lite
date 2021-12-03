Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :users, only: :create do
  resources :discover, only: :index
  resources :movies, only: [:index, :show]
end

resources :parties, only: [:create, :new]

get '/users/:user_id', to: 'users#show', as: 'dashboard'
get '/register', to: 'users#new', as: 'register'

root to: "landing#index"

end
