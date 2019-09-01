class Api::V1::TasksController < Api::V1::ApiController
  before_action :authorize_access_request!

  before_action :set_task, only: %i[show update destroy]

  def index
    tasks = policy_scope(Task).ordered

    render json: TaskSerializer.new(tasks).serialized_json, status: :ok
  end

  def show
    authorize @task

    render json: TaskSerializer.new(@task).serialized_json, status: :ok
  end

  def create
    task = Project.find(params[:project_id]).tasks.new(task_params)

    authorize task

    task.save!

    render json: TaskSerializer.new(task).serialized_json, status: :created
  end

  def update
    authorize @task

    @task.update!(task_params)

    render json: TaskSerializer.new(@task).serialized_json, status: :ok
  end

  def destroy
    authorize @task

    @task.destroy!

    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :deadline)
  end
end
