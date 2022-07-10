Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 get '/', to: 'welcome#index'
 get '/register', to: 'users#new'
 get '/users/:id', to: 'users#show'
#  post '/users/:id/movies/:id/parties/new', to: 'parties#create'
 
 resources :users, only: %i[create show new] do 
  get '/discover', to: 'movies#discover', as: 'movies_discover'
  get '/movies', to: 'movies#top_rated', as: 'top_rated' 
  post '/movies_search', to: 'movies#search', as: 'search'
  resources :movies, only: %i[index show] do
      resources :parties, only: %i[create new]
    end

end

end
