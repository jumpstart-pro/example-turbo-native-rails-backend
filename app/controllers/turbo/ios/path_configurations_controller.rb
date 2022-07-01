module Turbo
  module Ios
    class PathConfigurationsController < ApplicationController
      def show
        render json: {
          settings: {
            tabs: [
              {
                title: "Home",
                path: "/",
                ios_system_image_name: "house"
              }
            ]
          },
          rules: [
            {
              patterns: [
                "/new$",
                "/edit$"
              ],
              properties: {
                presentation: "modal"
              }
            },
            # Needs a /api/v1/users_controller.rb for auth if you want native sign up
            # {
            #   patterns: [
            #     "/users/sign_up"
            #   ],
            #   properties: {
            #     flow: "registration"
            #   }
            # },
            {
              patterns: [
                "/users/sign_in"
              ],
              properties: {
                flow: "authentication"
              }
            }
          ]
        }
      end
    end
  end
end
