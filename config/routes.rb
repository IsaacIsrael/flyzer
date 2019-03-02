Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :flights, only: [:index,:new] do
    resources :orders, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end
  end
  get 'flight/:id', to: 'flights#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'flights/load', to:'flights#load', as: :flight_load
  get 'flights/search', to:'flights#search', as: :flight_search
  resources :tickets
end
