Berr::Application.routes.draw do
  get "register" => "users#new", :as => "register"  
  get "login" => "sessions#create", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :users  
  resources :sessions
  resources :berrs do
  	collection do
      get :all
    end
  end

  root :to => "berrs#index"  
end
