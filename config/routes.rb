Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'users#new', as: :new_user

  resources :users, only: %i[show index create] do
    scope module: 'users' do
      resources :discover, only: :index
      resources :movies, only: %i[index show] do
        resources :viewing_parties, only: %i[new create]
      end
    end
  end
end
