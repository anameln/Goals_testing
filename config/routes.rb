Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals, only: [:new, :create] do
    member do
      patch 'complete'
    end
  end
end
