Rails.application.routes.draw do
  resources :datos_personas
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
end