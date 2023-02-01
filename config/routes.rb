Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index], controller: "users/discover"
    resources :movies, only: [:index, :show], controller: "users/movies"
    get "/movies?q=top_rated", to: "movies#top_rated"
    get "/movies?q=keyword", to: "movies#keyword"
  end
  # namespace :users do
  # end
end
