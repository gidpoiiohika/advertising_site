Rails.application.routes.draw do
  devise_for :users
  
  root 'adverts#index'

  devise_scope :user do
    authenticated  :user do
      root 'adverts#index'
    end

    unauthenticated do
      root 'adverts#index'
    end
  end

  resources :adverts
  resources :categories

  namespace :admin do
    root to: 'main#index'
    get 'main/index'
    resources :adverts
  end

  resources :adverts do
    member do
      get 'copy'
    end
  end
end
