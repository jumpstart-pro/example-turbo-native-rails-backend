Rails.application.routes.draw do
  devise_for :users

  resources :posts

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth, only: :create
    end
  end

  namespace :turbo do
    namespace :ios do
      resource :path_configuration, only: :show
    end
  end

  # Defines the root path route ("/")
  root "posts#index"
end
