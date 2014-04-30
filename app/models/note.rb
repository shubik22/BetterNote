class Note < ActiveRecord::Base
  validates :author, :notebook, presence: true

  include PgSearch

  pg_search_scope :search_by_title_and_body, against: [:title, :body]

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
  has_many :likes, inverse_of: :note, dependent: :destroy
  has_many :likers, through: :likes, source: :owner
end