Rails.application.routes.draw do


  get 'cart/index'
  get 'cart/addcart'
  get 'cart/emptyWare'
  get 'cart/checkout'
  get 'cart/deleteWare'

  get "wares/edit"
  get "users/showLogin"
  get "users/login"
  get "users/checkname"
  get "users/errorLogin"

  get 'orders/index'
  get 'orders/emptyOrder'

  resources :orders
  resources :users

  resources :wares

  get 'home/index'
  root :to => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
