Rails.application.routes.draw do
  devise_for :users
  resources :lists

  get 'welcome/index'
  root 'welcome#index'

end
