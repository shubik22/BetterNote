class Notification < ActiveRecord::Base
  validates :user, :notifiable_id, :notifiable_type, presence: true

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  include Rails.application.routes.url_helpers

  def text
    if self.notifiable_type == "Comment"
      return "#{notifiable.author.username} commented on one of your notes!"
    elsif self.notifiable_type == "Like"
      return "#{notifiable.owner.username} liked one of your notes!"
    elsif self.notifiable_type == "Friendship"
      return "#{notifiable.in_friend.username} accepted your friend request!"
    end
  end

  def url
    if self.notifiable_type == "Comment"
      return note_url(notifiable.note)
    elsif self.notifiable_type == "Like"
      return note_url(notifiable.note)
    elsif self.notifiable_type == "Friendship"
      return user_url(notifiable.in_friend)
    end
  end

  def default_url_options
    options = {};
    options[:host] = (Rails.env == "development") ?
      "localhost:3000" : "http://infinite-bayou-9601.herokuapp.com/"
    options
  end
end