class Like < ActiveRecord::Base
  validates :owner, :note, presence: true
  validates :owner, uniqueness: { scope: :note }
  after_save :create_notification

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id
  )

  belongs_to :note
  has_many :notifications, as: :notifiable, dependent: :destroy

  private
  def create_notification
    self.notifications.create({user_id: self.note.author_id})
  end
end