Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create] do
    get 'discover'
    resources :movies, only: [:index, :show]
    # post 'search', to: 'users#search'
  end
  # namespace :users do
  # end
end
