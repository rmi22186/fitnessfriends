Fitnessfriendfinder::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root :to => 'welcome#index'

  resources :users, only: [:show]
  resources :welcome

  get "/edit_profile" => "users#editprofile", :as => "edit_profile"
  put "/update_profile" => "users#updateprofile", :as => "update_profile"

end