class Comment < ActiveRecord::Base
  validates :author, :note, presence: true
  after_save :create_notification

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id
  )

  belongs_to :note

  has_many :notifications, as: :notifiable, dependent: :destroy

  private
  def create_notification
    self.notifications.create({user_id: self.note.author_id})
  end
end