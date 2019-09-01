class CommentSerializer
  include FastJsonapi::ObjectSerializer

  attributes :body, :image

  belongs_to :task
end
