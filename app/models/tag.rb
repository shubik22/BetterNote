class Tag < ActiveRecord::Base
  validates :owner, :name, presence: true
  validates :name, uniqueness: { scope: :owner }

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id
  )

  has_many :note_tags, inverse_of: :tag, dependent: :destroy
  has_many :notes, through: :note_tags, source: :note
end