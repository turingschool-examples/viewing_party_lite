# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :users, only: %i[index show create] do
    get '/discover', to: 'users#discover'
  end
  get '/register', to: 'users#new'
end
