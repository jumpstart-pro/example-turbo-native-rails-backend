# Note that generic iOS configuration is in ApplicationNotification.
#
# Rails credentials are used to fetch the key ID, team ID, and bundle identifier.
# bin/rails credentials:edit --environment development
#
# You must also place your APNS .p8 file here: config/certs/ios/apns.p8
#
class NewPostNotification < ApplicationNotification
  deliver_by :database
  deliver_by :ios, format: :ios_format, development: :development?

  param :post

  def message
    "A new post was published"
  end

  def url
    post_path(params[:post])
  end
end
