Rails.application.routes.draw do
  resources :welcome, only: [:index]

  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new, :create] do
        resources :invitees, only: [:create]
      end
    end
    resources :discover, only: [:index]
  end
  
end
