Rails.application.routes.draw do
  # resources :meals
  # resources :profiles
  resources :users, only: [:create, :show, :index] 
  resources :profiles, only: [:create, :show, :index]
  resources :meals

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "meals#index"
  # --- User Routes ---
  # get "users/:id", to: "users#show"
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

  # --- Custom Routes ---
  get "/user/:id", to: "users#show"
  # get "/me", to: "users#show"

  get "/user/:id/meals", to: "meals#show"
  delete "/user/:id/meals", to: "meals#destroy"
  # get "/mymeals", to: "meals#show"

  get "/user/:id/profile", to: "profiles#show"
  # get "/myprofile", to: "profiles#show"

  put "/user/:id/profile", to: "profiles#update"
  # put "/myprofile", to: "profiles#show"

  # --- Sessions Routes ---
  post "/login", to: "sessions#create"
  get "/logged_in", to: "sessions#is_logged_in?"
  delete "/logout", to: "sessions#destroy"
  # post "/logout", to: "sessions#destroy"
end
