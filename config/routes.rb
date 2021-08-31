Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    collection do
      get :near_me
    end
    resources :journeys, only: [:show, :new, :create, :edit, :update]
    resources :notifications, only: [:show, :new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
