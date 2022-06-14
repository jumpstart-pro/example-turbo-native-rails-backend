class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_secure_token :authentication_token

  def self.valid_credentials?(email, password)
    user = find_by(email:)
    user&.valid_password?(password) ? user : nil
  end
end
