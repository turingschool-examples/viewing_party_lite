Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'
  get '/register', to: 'users#new'


  resources :users, only: [:create, :show, :edit, :update, :index] do
     resources :movies, only: %i[index show]

     get '/discover', to: 'users#discover'

  end
end
