class Project < ApplicationRecord
  MAX_NAME_LENGTH = 255

  belongs_to :user

  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
