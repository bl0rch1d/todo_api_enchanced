class Api::V1::Tasks::PrioritizationsController < Api::V1::ApiController
  before_action :authorize_access_request!

  def update
    task = Task.find(params[:task_id])

    authorize task

    task.set_list_position(params[:task][:position])

    render json: TaskSerializer.new(task).serialized_json, status: :ok
  end
end
