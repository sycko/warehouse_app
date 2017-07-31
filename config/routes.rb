Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get '/warehouses',	to: 'static_pages#warehouses'
  get '/products', 		to: 'static_pages#products'
  get '/signup',		to: 'users#new'
end
