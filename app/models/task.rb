class Task < ApplicationRecord
  MAX_NAME_LENGTH = 50

  acts_as_list scope: :project

  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :deadline, deadline: true, if: :deadline_changed?

  scope :ordered, -> { order(position: :asc) }
end
