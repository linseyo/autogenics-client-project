Rails.application.routes.draw do
  root to: 'experiments#index'

  resources :experiments
end
