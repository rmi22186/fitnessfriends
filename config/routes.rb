Fitnessfriendfinder::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root :to => 'welcome#index'

  resources :profiles, only: [:show]
  resources :welcome

  
#better way to organize this?

  get "/search" => "users#search_page", :as => "search_page"
  put "/search_users" => "users#search_users", :as => "search_users"

  get "/edit_profile" => "profiles#edit", :as => "edit_profile"
  put "/update_profile" => "profiles#update", :as => "update_profile"

  get "/results" => "users#results_page", :as => "results_page"

  get "/edit_password" => "users#edit_password", :as => "edit_password"
  put "/update_password" => "users#update_password", :as => "update_password"

end