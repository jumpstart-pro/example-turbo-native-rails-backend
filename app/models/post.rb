class Post < ApplicationRecord
  validates :title, :body, presence: true

  after_create_commit :send_notifications

  private

  def send_notifications
    NewPostNotifier.with(record: self).deliver(User.all)
  end
end
