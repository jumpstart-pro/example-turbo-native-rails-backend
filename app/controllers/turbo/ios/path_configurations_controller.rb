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
            # TODO: Needs a /api/v1/users_controller.rb for registration to work
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
