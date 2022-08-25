Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
=======

>>>>>>> 1ab1465486320222759f1dbe1b63ed872136638a
  root 'welcome#index'

  get '/register', to: "users#new"
  post '/users', to: "users#create"
  get 'users/:id', to: 'users#show'
  get 'users/:id/discover', to: 'movies#index'
<<<<<<< HEAD
=======

>>>>>>> 1ab1465486320222759f1dbe1b63ed872136638a
end
