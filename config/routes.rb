Rails.application.routes.draw do
  get 'projects/index'
  root "projects#index"
end