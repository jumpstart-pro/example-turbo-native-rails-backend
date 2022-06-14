Rails.application.routes.draw do
  resources :posts

  # Defines the root path route ("/")
  root "posts#index"
end
