module Api::V1
  module Tasks::Contract
    class Create < Reform::Form
      property :name

      validates :name, presence: true, length: { maximum: Task::MAX_NAME_LENGTH }

      collection :comments, populate_if_empty: Comment do
        property :body
        property :image

        validates :body, presence: true, length: { within: Comment::BODY_LENGTH_RANGE }
        validates :image, image: true
      end
    end
  end
end
