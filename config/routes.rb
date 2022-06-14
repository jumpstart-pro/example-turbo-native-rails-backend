Rails.application.routes.draw do
  devise_for :users

  resources :posts

  namespace :turbo do
    namespace :ios do
      resource :path_configuration, only: :show
    end
  end

  # Defines the root path route ("/")
  root "posts#index"
end
