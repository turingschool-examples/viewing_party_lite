Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing_page#index'

  resources :users, only:[:show, :new, :create] do
    resources :discoveries, only:[:index]
  end
end
