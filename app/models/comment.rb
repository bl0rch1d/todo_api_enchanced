class Comment < ApplicationRecord
  BODY_LENGTH_RANGE = (10..256).freeze

  belongs_to :task

  has_one_attached :image
end
