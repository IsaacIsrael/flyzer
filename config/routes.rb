Rails.application.routes.draw do

  # This supose to work for redirect when user type the page withtout 'www'
  # if Rails.env.production?
  #  match '(*any)', to: redirect(subdomain: 'www'), via: :all, constraints: {subdomain: ''}
  # end

  require "sidekiq/web"


  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }


  get 'flights/load', to:'flights#load', as: :flight_load
  get 'flights/search', to:'flights#search', as: :flight_search
  resources :flights, only: [:index,:new, :show] do
    resources :orders, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end
  end

  resources :tickets
end
