module Turbo
  module Android
    class PathConfigurationsController < ApplicationController
      def show
        render json: {
          settings: {
            # Tabs are serialized to a string. RE: https://github.com/hotwired/turbo-android/issues/209
            tabs: [
              {
                title: "Home",
                path: root_path,
                icon: "home"
              },
              {
                title: "Posts",
                path: posts_path,
                icon: "announcement"
              }
            ].to_json
          },
          rules: [
            {
              patterns: [".*"],
              properties: {
                context: "default",
                uri: "turbo://fragment/web",
                fallback_uri: "turbo://fragment/web",
                pull_to_refresh_enabled: true
              }
            },
            {
              patterns: ["^$", "^/$"],
              properties: {
                uri: "turbo://fragment/web/home",
                presentation: "replace_root"
              }
            },
            {
              patterns: ["/new$", "/edit$"],
              properties: {
                context: "modal",
                uri: "turbo://fragment/web/modal/sheet",
                pull_to_refresh_enabled: false
              }
            },
            {
              patterns: ["/users/sign_in"],
              properties: {
                uri: "turbo://fragment/users/sign_in",
                context: "modal"
              }
            }
          ]
        }
      end
    end
  end
end
