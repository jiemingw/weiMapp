WeiMapp::Application.routes.draw do
  resources :wei_users

  resources :weis

  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
#  root to: 'visitors#new'
  root to: 'wei_users#index'
end