Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'welcome#index'
  get '/login', to: 'welcome#login_form'
  post '/login', to: 'welcome#login'

  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'

  get '/discover', to: 'discover#index'

  get '/movies/:movie_id', to: 'movies#show'
  get '/movies', to: 'movies#index'

  get '/movies/:movie_id/viewing_parties/new', to: 'viewing_parties#new'
  post '/movies/:movie_id/viewing_parties', to: 'viewing_parties#create'
end
