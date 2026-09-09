module API
  module V1
    class AuthsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:destroy]

      def destroy
        Current.user.notification_tokens
          .find_by(token: params[:notification_token])&.destroy
        terminate_session
        render json: {}
      end
    end
  end
end
