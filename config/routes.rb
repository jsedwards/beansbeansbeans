Beansbeansbeans::Application.routes.draw do
  root "listings#index"
  resources :listings do 
    resources :comments 
  end
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
