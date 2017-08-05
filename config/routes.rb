Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'products/new', 	to: 'products#new'

  get 'users/new'

  root 'static_pages#home'
  get '/warehouses',	to: 'static_pages#warehouses'
  get '/signup',		to: 'users#new'
  get    '/login',   	to: 'sessions#new'
  post   '/login',   	to: 'sessions#create'
  delete '/logout',  	to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :products
end
