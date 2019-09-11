class Task < ApplicationRecord
  MAX_NAME_LENGTH = 50
  MIN_POSITION_VALUE = 1

  acts_as_list scope: :project

  belongs_to :project
  has_many :comments, dependent: :destroy

  scope :ordered, -> { order(position: :asc) }
end
