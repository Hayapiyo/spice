Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :users, only: [:show, :edit, :update] do
  end
  resources :groups do
    resources :messages

    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
  resources :projects do
    member do
      put "contract"
    end
  end
end