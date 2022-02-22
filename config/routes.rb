Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'dashboards#index'
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  resources :projects
  resources :role_dashboards
  resources :bugs
  resources :assign_bugs

  # authenticated :user do
  #   root :to => 'projects#index'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
