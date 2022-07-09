module API
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_token!, only: :create

      def create
        user = User.new(devise_parameter_sanitizer.sanitize(:sign_up))

        if user.save
          user.remember_me = true
          sign_in(user)
          render json: {token: user.authentication_token}
        else
          render json: {error: user.errors.full_messages.to_sentence},
            status: :unprocessable_entity
        end
      end

      private

      def devise_parameter_sanitizer
        Devise::ParameterSanitizer.new(User, :user, params)
      end
    end
  end
end
