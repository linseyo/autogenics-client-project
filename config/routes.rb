Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get 'users/login'
  post 'users/login'
  delete 'users/logout'

  root to: 'experiments#index'

  resources :experiments

end
