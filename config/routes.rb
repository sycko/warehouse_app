Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/warehouses'

  get 'static_pages/products'

  root 'application#hello'
end
