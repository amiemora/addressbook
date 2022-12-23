Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "main" => "main#index"
  
  
  namespace :v1 do 
    get "signup" => "users#new"
    get "login" => "sessions#new"
    get "logout" => "sessions#destroy"
    resources :people
    resources :emails 
    resources :phone_numbers 
    resources :addresses
    
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create, :destroy]
  end 
  

end
