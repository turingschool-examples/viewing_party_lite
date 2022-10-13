Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#landing'
  get '/register', to:'users#new'
  resources :users, only: [:index, :show, :create] do
    post '/movies_top_rated', to: 'movies#top_rated'
    post '/movies_search', to: 'movies#search'
    resources :discover, only: [:index], module: 'users'
    resources :movies, only: [:index, :show], module: 'users' do
      resources :viewing_parties, only: [:new, :create, :index, :show]
    end
  end
end
