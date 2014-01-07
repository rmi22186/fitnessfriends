Fitnessfriendfinder::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root :to => 'welcome#index'

  resources :users, only: [:show]

  resources :welcome

  

  get "/search" => "users#search", :as => "search"
  get "/edit_profile" => "users#editprofile", :as => "edit_profile"
  put "/update_profile" => "users#updateprofile", :as => "update_profile"

  get "/edit_password" => "users#edit_password", :as => "edit_password"
  put "/update_password" => "users#update_password", :as => "update_password"

end