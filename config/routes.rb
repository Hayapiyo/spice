Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :users, only: [:edit, :update]
  resources :groups do
    resources :messages
  end
end