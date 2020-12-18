Rails.application.routes.draw do
  devise_for :users
  root to: 'collects#index'
  resources :collects do
    resources :comments, only: [:create]
  end
end
