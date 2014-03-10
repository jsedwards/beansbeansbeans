Beansbeansbeans::Application.routes.draw do
  root "listings#index"
  resources :listings
end
