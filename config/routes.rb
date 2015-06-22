Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals, only: [:new, :create, :update]
end
