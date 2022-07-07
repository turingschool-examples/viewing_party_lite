Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 get '/', to: 'welcome#index'
 get '/register', to: 'users#new'
 get '/users/:id', to: 'users#show'
 resources :users, only: %i[create show] do 
  get '/discover', to: 'movies#discover', as: 'movies_discover'
  get '/movies', to: 'movies#top_rated', as: 'top_rated'
 end

end
