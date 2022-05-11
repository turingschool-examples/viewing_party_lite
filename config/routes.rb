Rails.application.routes.draw do
  get '/', to: 'landing_page#index'

  post '/users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get '/users/:id/movies?sort=top_rated', to: 'movies#top_rated'
  get 'users/:id/discover', to: 'movies#index'
  get 'users/:id', to: 'users#show'
end
