Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get 'kitchen_sink', to: 'pages#kitchen_sink'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
