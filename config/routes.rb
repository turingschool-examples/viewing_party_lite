Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'welcome#index'

  get 'register' => 'users#new'
  get '/user/:id/discover', to: 'users#discover'

  resources :users, only: %i[show create] do
    resources :movies, controller: :user_movies
  end
end
