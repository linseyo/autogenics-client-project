Rails.application.routes.draw do
  root to: 'experiments#index'

  resources :users
  resources :experiments

end
