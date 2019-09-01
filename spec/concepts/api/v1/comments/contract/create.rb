module Api::V1
  module Comments::Contract
    class Create < Reform::Form
      property :body
      property :image, populator: ->(ctx) { model.image.attach(ctx[:fragment]) }

      validates :body, presence: true, length: { within: Comment::BODY_LENGTH_RANGE }
      validates :image, image: true
    end
  end
end
