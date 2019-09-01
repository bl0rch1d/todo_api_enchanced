class Api::V1::Tasks::CompletionsController < Api::V1::ApiController
  before_action :authorize_access_request!

  def update
    task = Task.find(params[:task_id])

    authorize task

    task.update!(completed: !task.completed)

    render json: TaskSerializer.new(task).serialized_json, status: :ok
  end
end
