Rails.application.routes.draw do
  devise_for :users
  get 'pages/profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
end
