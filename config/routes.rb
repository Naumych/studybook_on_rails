# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :carriages

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
