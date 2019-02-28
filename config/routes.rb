Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :flights, except: :show
  get 'flight/:id', to: 'flights#show'
end
