class NoteTag < ActiveRecord::Base
  validates :tag, :note, presence: true
  validates :tag, uniqueness: { scope: :note }

  belongs_to :note
  belongs_to :tag
end
