Rails.application.routes.draw do
  resources :campaigns
  devise_for :users
  get 'pages/profile'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "campaigns#index"
end
