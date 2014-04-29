Rails.application.routes.draw do
  resources :lists

  get 'welcome/index'
  root 'welcome#index'

end
