Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :wordpresses
    resources :orders do
      collection { get :update_orders }
    end
    root to: 'users#index'
  end
end
