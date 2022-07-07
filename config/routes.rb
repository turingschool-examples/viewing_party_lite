Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :users, only: %i[show create] do
    resources :discover, controller: :movies
  end
  get 'register' => 'users#new'

  resources :movies, only: :index
end
