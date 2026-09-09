Rails.application.routes.draw do
  get :login, to: "sessions#new", as: :new_session
  resource :session, only: [:create, :destroy]
  get :signup, to: "registrations#new", as: :new_registration
  resource :registration, only: :create

  resource :site
  resources :posts

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth, only: [:destroy]
      resources :notification_tokens, only: :create
    end
  end

  namespace :hotwire do
    namespace :ios do
      resource :path_configuration, only: :show
    end
    namespace :android do
      resource :path_configuration, only: :show
    end
  end

  get :reset_app, to: "site#reset_app"

  # Defines the root path route ("/")
  root "site#show"
end
