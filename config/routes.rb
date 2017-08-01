Rails.application.routes.draw do
  get 'sessions/new'

  get 'products/new', 	to: 'products#new'

  get 'users/new'

  root 'static_pages#home'
  get '/warehouses',	to: 'static_pages#warehouses'
  get '/products', 		to: 'static_pages#products'
  get '/signup',		to: 'users#new'
  get    '/login',   	to: 'sessions#new'
  post   '/login',   	to: 'sessions#create'
  delete '/logout',  	to: 'sessions#destroy'
  resources :users
  resources :products
end
