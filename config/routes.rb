Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :users
end
