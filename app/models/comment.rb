class Comment < ActiveRecord::Base
  validates :author, :note, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id
  )

  belongs_to :note
end