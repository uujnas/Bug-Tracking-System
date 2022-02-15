class BugsController < RoleDashboardsController
  before_action :authenticate_user!
  before_action :set_bug, only: %i[show edit update destroy]

  def index
    @bugs = Bug.all
    # @bug = current_user.bugs.build
  end

  def shown; end

  def new
    @bug = Bug.new
  end

  def edit; end

  def create
    @bug = current_user.bugs.create(bug_params)
    if @bug.save
      redirect_to bug_url(@bug), notice: 'bug was successfully created'
    else
      render :new, alert: 'Unable to create'
    end
  end

  def update
    if @bug.update(bug_params)
      redirect_to bug_url(@bug), notice: 'bug is successfully created'
    else
      render :edit, alert: 'Sorry unable to update'
    end
  end

  def destroy
    @bug.destroy
    redirect_to bugs_path, notice: 'Bug is successfully deleted'
  end

  private

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :user_id, :project_id)
  end

end