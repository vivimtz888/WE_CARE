Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end

  resources :rooms, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end

  namespace :user do
    resources :bookings, only: [:index]
  end

end
