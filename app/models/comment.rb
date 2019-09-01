class Comment < ApplicationRecord
  BODY_LENGTH_RANGE = (10..256).freeze

  belongs_to :task

  has_one_attached :image

  validates :body, presence: true, length: { within: BODY_LENGTH_RANGE }
  validates :image, image: true
end
