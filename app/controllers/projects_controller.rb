class ProjectsController < RoleDashboardsController
  before_action :authenticate_user!
  # authorize_resource
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_authorization, only: %i[edit update destroy show new create]

  def index
    FirstJob.perform_later 1, 2, 3
    @projects = Project.all.order(title: :asc)
    @project = Project.new
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = current_user.projects.create(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Successfully created' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: 'Successfully updated project'}
        format.js
      else
        format.js
        format.html{ render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'project is successfully deleted' }
      format.js
    end
  end

  private 

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :project_id)
  end

  def set_authorization
    authorize! :read, @current_user
  end

end
