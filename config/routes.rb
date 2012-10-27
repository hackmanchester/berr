Berr::Application.routes.draw do
  get "register" => "users#new", :as => "register"  
  root :to => "users#new"  
  resources :users  
end
