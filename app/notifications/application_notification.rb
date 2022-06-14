class ApplicationNotification < Noticed::Base
  def ios_format(apn)
    apn.alert = message
    apn.custom_payload = {url: url}
  end

  # Use APNS's sandbox server to send notifications to apps run via Xcode.
  def development?
    Rails.env.development?
  end

  def ios_device_tokens(recipient)
    recipient.notification_tokens.where(platform: "iOS").pluck(:token)
  end

  # Remove expired or invalid tokens from the system.
  def cleanup_device_token(token:, platform:)
    NotificationToken.find_by(token: token.token, platform:)&.destroy
  end
end
