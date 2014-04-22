class Note < ActiveRecord::Base
  validates :author, :notebook, presence: true

  belongs_to(
    :author,
    class_name: User,
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to :notebook
  has_many :comments, inverse_of: :note, dependent: :destroy
  has_many :note_tags, inverse_of: :note, dependent: :destroy
  has_many :tags, through: :note_tags, source: :tag
end