class Notification < ActiveRecord::Base
  validates :user, :notifiable_id, :notifiable_type, presence: true

  belongs_to :user
end