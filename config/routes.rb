Rails.application.routes.draw do
  root to: 'experiments#index'

  get 'users/login', to: 'sessions#new'
  # post 'users/login', to: 'sessions#create'
  delete 'users/logout', to: 'sessions#destroy'

  resources :users

  resources :experiments
  resources :sessions, only: [:create]

end
