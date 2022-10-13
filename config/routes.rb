# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index', as: :landing_page

  get 'register', to: 'users#new'

  resources :users do
    resources :movies do
      resources :viewing_parties
    end

    get 'discover', to: 'movies#search'
  end
end
