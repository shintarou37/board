Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: 'collects#index'
  resources :collects do
    resources :comments, only: :create
  end
end
