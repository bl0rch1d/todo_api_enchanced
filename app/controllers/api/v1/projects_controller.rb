class Api::V1::ProjectsController < Api::V1::ApiController
  before_action :authorize_access_request!

  before_action :set_project, only: %i[show update destroy]

  def index
    projects = policy_scope(Project)

    render json: ProjectSerializer.new(projects).serialized_json, status: :ok
  end

  def show
    authorize @project

    render json: ProjectSerializer.new(@project).serialized_json, status: :ok
  end

  def create
    project = current_user.projects.new(project_params)

    authorize project

    project.save!

    render json: ProjectSerializer.new(project).serialized_json, status: :created
  end

  def update
    authorize @project

    @project.update!(project_params)

    render json: ProjectSerializer.new(@project).serialized_json, status: :ok
  end

  def destroy
    authorize @project

    @project.destroy!

    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
