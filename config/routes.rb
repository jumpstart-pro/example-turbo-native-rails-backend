Rails.application.routes.draw do
  devise_for :users

  resources :posts

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth, only: [:create, :destroy]
    end
  end

  namespace :turbo do
    namespace :ios do
      resource :path_configuration, only: :show
      resources :notification_tokens, only: :create
    end
  end

  # Defines the root path route ("/")
  root "posts#index"
end
