class Project < ApplicationRecord
  MAX_NAME_LENGTH = 255

  belongs_to :user

  has_many :tasks, dependent: :destroy
end
