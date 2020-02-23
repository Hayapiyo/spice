Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :users, only: [:edit, :update]
  # get 'projects/index'
  # root "projects#index"
end