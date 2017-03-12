Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#new"

  resources :users

  resources :groceries

  resources :catagories


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  namespace :api do
    namespace :v1 do
      resources :user
    end
  end



end
