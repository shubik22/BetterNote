class Notification < ActiveRecord::Base
  validates :user, :notifiable_id, :notifiable_type, presence: true

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  def subject
    if self.notifiable_type == "Comment"
      return Comment.find(self.notifiable_id)
    elsif self.notifiable_type == "Friendship"
      return Friendship.find(self.notifiable_id)
    elsif self.notifiable_type == "Like"
      return Like.find(self.notifiable_id)
    end
  end
end