Rails.application.routes.draw do
  get 'orders/success'
  get 'orders/bought'
  get 'orders/sold'
  resources :listings
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#home'

  post "orders/:id/order", to: "orders#webhook", as: "webhook"
  get 'orders/success'
  post "/orders/webhook", to: "orders#webhook"
  get 'search', to: "listings#search"
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
