Rails.application.routes.draw do
  get "users/show"
  get "gossips/index"
  get "gossips/show"
  get "pages/team"
  get "pages/contact"
  get "pages/welcome"
  root "gossips#index"

  get "/team",    to: "pages#team"
  get "/contact", to: "pages#contact"
  get "/welcome/:first_name", to: "pages#welcome", as: "welcome"

  resources :gossips, only: [:index, :show]
  resources :users,   only: [:show]
end