Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals, only: [:new, :create, :show] do
    member do
      patch 'complete'
    end
  end
  resources :comments, only: :create
  resources :cheers, only: :create
end
