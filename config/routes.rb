Rails.application.routes.draw do
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'
  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :posts do 
    collection do
      post :confirm
    end
  end
end
