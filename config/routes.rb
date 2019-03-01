Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/show'
  get 'tickets/new'
  get 'tickets/create'
  get 'tickets/destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :flights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights
end
