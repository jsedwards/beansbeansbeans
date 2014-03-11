Beansbeansbeans::Application.routes.draw do
  root "listings#index"
  resources :listings
  resources :users
end
