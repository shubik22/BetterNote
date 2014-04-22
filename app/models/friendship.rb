class Friendship < ActiveRecord::Base
  validates :in_friend, :out_friend, presence: true
  validates :in_friend, uniqueness: { scope: :out_friend }

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
end