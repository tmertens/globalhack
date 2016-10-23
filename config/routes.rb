require 'housing_first/api/base'

Rails.application.routes.draw do

  resources :intake_forms
  devise_for :users
  get 'pages/index'
  root 'pages#index'

  get '/give' => 'pages#give'
  get '/search' => 'pages#find_client_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :organizations, except: [:destroy]

  # Don't remove this route!!!
  get 'profiles/:username' => 'profiles#show'
  resources :profiles, only: [:show, :new]

  resources :payments, only: [:create, :show]

  namespace :admin do
    get '/' => 'dashboard#index'

    resources :organizations
  end

  namespace 'rails_api' do
    resources :people
    resources :clients_organizations
    resources :organizations
    resources :client_profiles
  end

  get 'map' => 'maps#show'

  # Grape API routes will be mounted under the `api` namespace
  mount ::HousingFirst::Api::Base => '/'

  resources :client_profiles
  resources :clients
end
