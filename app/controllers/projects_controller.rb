class ProjectsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_url(@project), notice: 'project was successfully created'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_url(@project), notice: 'project is successfully created'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'project is successfully deleted'
  end

  private 

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

end
