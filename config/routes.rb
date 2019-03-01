Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :flights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights
  resources :tickets
end
