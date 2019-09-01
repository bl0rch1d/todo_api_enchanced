class Api::V1::Tasks::CommentsController < Api::V1::ApiController
  before_action :authorize_access_request!

  def index
    comments = policy_scope(Comment)

    render json: CommentSerializer.new(comments).serialized_json, status: :ok
  end

  def create
    comment = Task.find(params[:task_id]).comments.new(comment_params)

    authorize comment

    comment.save!

    render json: CommentSerializer.new(comment).serialized_json, status: :created
  end

  def destroy
    comment = Comment.find(params[:id])

    authorize comment

    comment.destroy!

    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image)
  end
end
