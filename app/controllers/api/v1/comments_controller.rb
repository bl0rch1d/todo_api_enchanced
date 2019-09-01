class Api::V1::CommentsController < Api::V1::ApiController
  before_action :authorize_access_request!

  def index
    endpoint Api::V1::Comments::Operation::Index, current_user: current_user
  end

  def create
    endpoint Api::V1::Comments::Operation::Create, current_user: current_user
  end

  def destroy
    endpoint Api::V1::Comments::Operation::Destroy, current_user: current_user
  end
end
