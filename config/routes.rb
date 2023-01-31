Rails.application.routes.draw do
  resources :welcome, only: [:index]

  resources :users, only: [:show, :new, :create] do
    resources :discover, only:[:index]
  end
end
