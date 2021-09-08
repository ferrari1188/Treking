Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    member do
      get 'map'
    end
    resources :notifications, only: [:create]
  end
  resources :notifications, only: [:index, :show]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
