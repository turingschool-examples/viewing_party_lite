Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  resources :users, only: %i[index show create] do
    resources :discover, only: %i[index]
    resources :movies, only: %i[index show]
  end

end
