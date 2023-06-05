module Turbo
  module Ios
    class PathConfigurationsController < ApplicationController
      def show
        render json: {
          settings: {
            tabs: [
              {
                title: "Home",
                path: root_path,
                ios_system_image_name: "house"
              },
              {
                title: "Posts",
                path: posts_path,
                ios_system_image_name: "square.and.pencil"
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
            {
              patterns: [
                "/users/sign_up"
              ],
              properties: {
                flow: "registration"
              }
            },
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
