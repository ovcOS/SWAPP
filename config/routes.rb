Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :connections, only: %i[new create show index destroy]
  resources :users, except: %i[new create]
  resources :media, except: %i[edit update index]
  resources :messages, only: %i[create]

  get 'getting_started', to: 'users#getting_started', as: 'getting_started'
  get 'profile', to: 'pages#profile', as: 'profile'
  mount ActionCable.server => "/cable"
end
