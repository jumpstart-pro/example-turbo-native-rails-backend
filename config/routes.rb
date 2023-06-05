Rails.application.routes.draw do
  devise_for :users

  resource :site
  resources :posts

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth, only: [:create, :destroy]
      resources :notification_tokens, only: :create
      resources :users, only: :create
    end
  end

  namespace :turbo do
    namespace :ios do
      resource :path_configuration, only: :show
    end
    namespace :android do
      resource :path_configuration, only: :show
    end
  end

  # Defines the root path route ("/")
  root "site#show"
end
