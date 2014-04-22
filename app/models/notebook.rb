class Notebook < ActiveRecord::Base
  validates :name, :owner, presence: true

  has_many :notes, inverse_of: :notebook, dependent: :destroy
  belongs_to :owner, class_name: "User"
end