Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end

  resources :rooms, only: [:index, :show, :new, :create] do
    resources "booking", only: [:new, :create ]
  end
end
