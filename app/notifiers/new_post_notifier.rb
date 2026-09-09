# Rails credentials are used to fetch the key ID, team ID, and bundle identifier.
# bin/rails credentials:edit --environment development
#
# You must also place your APNS .p8 file here: config/certs/ios/apns.p8
#
class NewPostNotifier < ApplicationNotifier
  deliver_by :ios do |config|
    config.format = :ios_format
    config.apns_key = -> { Rails.root.join("config/certs/ios/apns.p8").read }
    config.key_id = -> { Rails.application.credentials.dig(:ios, :key_id) }
    config.team_id = -> { Rails.application.credentials.dig(:ios, :team_id) }
    config.bundle_identifier = -> { Rails.application.credentials.dig(:ios, :bundle_identifier) }
    config.device_tokens = -> { recipient.notification_tokens.where(platform: "iOS").pluck(:token) }

    # Use APNS's sandbox server to send notifications to apps run via Xcode.
    config.development = Rails.env.development?

    # Remove expired or invalid tokens from the system.
    config.invalid_token = ->(token) { NotificationToken.find_by(token:, platform: "iOS")&.destroy }
  end

  notification_methods do
    def message
      "A new post was published"
    end

    def url
      post_path(record)
    end
  end

  def ios_format(notification, apn)
    apn.alert = notification.message
    apn.custom_payload = {url: notification.url}
  end
end
