Rails.application.routes.draw do
  root to: 'index#index'
  get 'users/login', :to => 'sessions#index'
  post 'users/login'
  delete 'users/logout', :to =>'sessions#destroy'


  resources :users



  resources :experiments
  resources :sessions, only: [:index, :new, :create, :destroy]

end
