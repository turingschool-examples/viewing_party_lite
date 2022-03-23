# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'landing_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
