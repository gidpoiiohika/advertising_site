Rails.application.routes.draw do
  resources :records
  devise_for :users
  
  root 'adverts#index'

  get 'pages/calculator_buc'

  get 'pages/calculators'

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
  resources :users

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
