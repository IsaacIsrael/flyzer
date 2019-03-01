Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :flights, only: [:index,:new] do
    resources :orders, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end
  end
  get 'flight/:id', to: 'flights#show'
end
