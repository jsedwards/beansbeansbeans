Beansbeansbeans::Application.routes.draw do
  root "listings#index"
  resources :listings
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
