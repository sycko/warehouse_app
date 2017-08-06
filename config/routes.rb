Rails.application.routes.draw do
  root 		'static_pages#home'
  get 		'/warehouses',			to: 'warehouses#index'
  get		'/warehouses/new',		to: 'warehouses#new'
  get		'/warehouses/show',		to: 'warehouses#show'
  get 		'/signup',				to: 'users#new'
  get   	'/login',   			to: 'sessions#new'
  post  	'/login',   			to: 'sessions#create'
  delete 	'/logout',  			to: 'sessions#destroy'
  get 		'password_resets/new'
  get 		'password_resets/edit'
  get 		'sessions/new'
  get 		'products/new', 		to: 'products#new'
  get 		'users/new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :products
  resources :warehouses
end
