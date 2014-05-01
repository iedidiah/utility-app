Rails.application.routes.draw do

  devise_for :users
  resources :lists do
    resources :items, only: [:create, :destroy, :update]
  end

  get 'welcome/index'
  root 'welcome#index'

end
