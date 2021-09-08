Rails.application.routes.draw do
  resources :meals
  resources :profiles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "meals#index"
  # --- User Routes ---
  # get "users", to: "users#index"
  # post "users", to: "users#create"
  # put "users/:id", to: "users#update"
  # delete "users/:id", to: "users#destroy"
  # --- Profile Routes ---
  # get "profiles", to: "profiles#index"
  # post "profiles", to: "profiles#create"
  # put "profiles/:id", to: "profiles#update"
  # delete "profiles/:id", to: "profiles#destroy"
  # --- Meal Routes ---
  # get "meals", to: "meals#index"
  # post "meals", to: "meals#create"
  # put "meals/:id", to: "meals#update"
  # delete "meals/:id", to: "meals#destroy"

  # --- Sessions Routes ---
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  # get "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
