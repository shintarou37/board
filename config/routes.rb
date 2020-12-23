Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'new_user_details', to: 'users/registrations#create_user_detail'
  end
  resources :users, only: [:show]
  root to: 'collects#index'
  get 'collects/search'
  resources :collects do
    resources :comments, only: :create
  end
end
