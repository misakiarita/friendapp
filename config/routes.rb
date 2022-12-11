Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :feeds
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
