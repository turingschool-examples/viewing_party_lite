Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'
  get '/register', to: 'users#new'


  resources :users, only: [:create, :show, :edit, :update, :index] do
    resources :discover, only: %i[index], controller: 'movies'
  end
end
