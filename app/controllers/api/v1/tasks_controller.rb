class Api::V1::TasksController < Api::V1::ApiController
  before_action :authorize_access_request!

  def index
    endpoint Api::V1::Tasks::Operation::Index, current_user: current_user
  end

  def show
    endpoint Api::V1::Tasks::Operation::Show, current_user: current_user
  end

  def create
    endpoint Api::V1::Tasks::Operation::Create, current_user: current_user
  end

  def update
    endpoint Api::V1::Tasks::Operation::Update, current_user: current_user
  end

  def destroy
    endpoint Api::V1::Tasks::Operation::Destroy, current_user: current_user
  end
end
