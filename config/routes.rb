Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "main" => "main#index"
  # reources :users, except [:index]
  # resources :sessions, except %i[index edit update show new destroy]
  namespace :v1 do 
    resources :people
    resources :emails 
    resources :phone_numbers 
    resources :addresses
    
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create, :destroy]
  end 
  

end
