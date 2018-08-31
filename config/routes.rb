Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :connections
  resources :users, except: %i[new create]
  get 'getting_started', to: 'users#getting_started', as: 'getting_started'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :media, except: %i[edit update index]
  root to: 'pages#home'
end
