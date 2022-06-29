Rails.application.routes.draw do
  get 'orders/success'
  get 'orders/bought'
  get 'orders/sold'
  resources :listings
  devise_for :users
  root 'pages#home'

  post "listings/:id/order", to: "listings#place_order", as: "place_order"

  get 'orders/success'
  post "/orders/webhook", to: "orders#webhook"
  get 'search', to: "listings#search"
  get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
