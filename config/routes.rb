Rails.application.routes.draw do
  root "sessions#home"

  resources :users
  resources :attractions
  post "/rides/new", to: "rides#new"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

end
