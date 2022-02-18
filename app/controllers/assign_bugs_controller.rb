class AssignBugsController < RoleDashboardsController
  def index
    @assign_bugs = AssignBug.all
  end

  def new
    @assign_bug = AssignBug.new
  end

  def edit
    @assign_bug = AssignBug.find(params[:id])
    @assign_bug = Bug.find(@assign_bug.bug_id)
  end

  def create
    @assign_bug = AssignBug.create!(assign_bugs_params)
    @user = User.find(@assign_bug.user_id)
    @bug = Bug.find(@assign_bug.bug_id)
    if @assign_bug.save
      AssignBugMailer.assign_bug_developer(@user, @bug).deliver
      redirect_to bugs_path, notice: 'Bug is successfully assigned'
    else
      render :new, alert: 'Unable to assign'
    end
  end

  private

  def assign_bugs_params
    params.require(:assign_bug).permit(:user_id, :bug_id)
  end
end
