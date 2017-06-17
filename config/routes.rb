Rails.application.routes.draw do
  resources :campaigns do
    resources :donations
    resources :comments
  end
  resources :donations
  resources :campaigns
  devise_for :users
  get 'pages/profile'
  get 'pages/index'
  get 'pages/dashboard'
  get 'campaigns/like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
end
