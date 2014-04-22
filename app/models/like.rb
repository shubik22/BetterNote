class Like < ActiveRecord::Base
  validates :owner, :note, presence: true
  validates :owner, uniqueness: { scope: :note }

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id
  )

  belongs_to :note
end