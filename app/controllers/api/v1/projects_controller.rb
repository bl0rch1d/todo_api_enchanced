class Api::V1::ProjectsController < Api::V1::ApiController
  before_action :authorize_access_request!

  def index
    endpoint Api::V1::Projects::Operation::Index, current_user: current_user
  end

  def show
    endpoint Api::V1::Projects::Operation::Show, current_user: current_user
  end

  def create
    endpoint Api::V1::Projects::Operation::Create, current_user: current_user
  end

  def update
    endpoint Api::V1::Projects::Operation::Update, current_user: current_user
  end

  def destroy
    endpoint Api::V1::Projects::Operation::Destroy, current_user: current_user
  end
end
