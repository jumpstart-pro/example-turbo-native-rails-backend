class Hotwire::Android::PathConfigurationsController < ApplicationController
  allow_unauthenticated_access

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
            icon: "newspaper"
          }
        ].to_json
      },
      rules: [
        {
          patterns: [".*"],
          properties: {
            context: "default",
            uri: "hotwire://fragment/web",
            fallback_uri: "hotwire://fragment/web",
            pull_to_refresh_enabled: true
          }
        },
        {
          patterns: ["^$", "^/$"],
          properties: {
            uri: "hotwire://fragment/web/home",
            presentation: "replace_root"
          }
        },
        {
          patterns: ["/new$", "/edit$"],
          properties: {
            context: "modal",
            uri: "hotwire://fragment/web/modal/sheet",
            pull_to_refresh_enabled: false
          }
        },
        {
          patterns: [new_session_path],
          properties: {
            uri: "hotwire://fragment/users/sign_in",
            context: "modal"
          }
        }
      ]
    }
  end
end
