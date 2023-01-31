Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing_page#index'

  resources :users, only:[:new, :show, :create] do
    resources :discovers, only: [:index]
  end
end
