class Post < ApplicationRecord
  validates :title, :body, presence: true

  after_create_commit :send_notifications

  private

  def send_notifications
    NewPostNotification.with(post: self).deliver_later(User.all)
  end
end
