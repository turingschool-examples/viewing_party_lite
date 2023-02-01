Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create] do
    get 'discover'
    get 'movies'
    post 'search', to: 'users#search'
  end
end
