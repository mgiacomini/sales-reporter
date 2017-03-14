require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'
  namespace :admin do
    resources :reports
    resources :users
    resources :wordpresses
    resources :orders do
      collection { get :update_orders }
    end
    root to: 'reports#index'
  end

  root to: 'admin/reports#index'
end
