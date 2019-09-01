class Api::V1::Tasks::CompletionsController < Api::V1::ApiController
  before_action :authorize_access_request!

  def update
    endpoint Api::V1::Tasks::Completion::Operation::Update, current_user: current_user
  end
end
