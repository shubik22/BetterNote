class Friendship < ActiveRecord::Base
  validates :in_friend, :out_friend, presence: true
  validates :in_friend, uniqueness: { scope: :out_friend }
  after_save :create_notification

  belongs_to(
    :in_friend,
    class_name: "User",
    foreign_key: :in_friend_id
  )

  belongs_to(
    :out_friend,
    class_name: "User",
    foreign_key: :out_friend_id
  )

  has_many :notifications, as: :notifiable, dependent: :destroy

  private
  def create_notification
    friendship = Friendship.find_by({
      in_friend_id: self.out_friend_id,
      out_friend_id: self.in_friend_id
    })
    self.notifications.create({user_id: self.out_friend_id}) unless friendship
  end
end