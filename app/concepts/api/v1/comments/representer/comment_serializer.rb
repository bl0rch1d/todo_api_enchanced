module Api::V1
  module Comments::Representer
    class CommentSerializer
      include FastJsonapi::ObjectSerializer

      attributes :body, :image

      belongs_to :task
    end
  end
end
