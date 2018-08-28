Rails.application.routes.draw do
  devise_for :users
  resources :users, except: %i[new create]
  get 'getting_started', to: 'users#getting_started', as: 'getting_started'
  get 'profile', to: 'pages#profile', as: 'profile'

  root to: 'pages#home'
end
