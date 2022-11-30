  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root("welcome#index")

  resources :users, except: [:new, :create] do 
    resources :movies
    get '/discover', to: 'discover#index'
    get '/movies', to: 'movies#top_rated'
    get '/movies', to: 'movies#search'
  end
  get("/register",   to: "users#new")
  post("/register",   to: "users#create")

  

  


  #discover controller to call API? "users/:id/discover"
end
