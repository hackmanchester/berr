Berr::Application.routes.draw do
  get "register" => "users#new", :as => "register"  
  get "login" => "sessions#create", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :users  
  resources :sessions
  resources :berrs

  root :to => "berrs#index"  
end
