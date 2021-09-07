Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    resources :journeys, only: [:show, :new, :create, :edit, :update]
    resources :notifications, only: [:create]
  end
  resources :notifications, only: [:index, :show]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
