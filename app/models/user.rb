class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :notification_tokens
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true
end
