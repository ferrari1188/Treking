Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    collection do
      get :near_me
    end
    resources :journeys, only: [:show, :new, :create, :edit, :update]
    resources :notifications, only: [:new, :create, :edit, :update]
  end
  resources :notifications, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
