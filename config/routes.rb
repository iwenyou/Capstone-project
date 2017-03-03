Rails.application.routes.draw do
  get 'groceries/index'

  get 'groceries/new'

  get 'groceries/show'

  get 'groceries/edit'

  get 'groceries/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  recources :groceries

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"


end
