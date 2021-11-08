Rails.application.routes.draw do
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]
end
