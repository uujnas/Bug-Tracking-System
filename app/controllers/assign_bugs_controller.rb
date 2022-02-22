class AssignBugsController < ApplicationController

  def index
    @assign_bugs = AssignBug.all
  end

  def new
    @assign_bug = AssignBug.new
  end


  def create
    @assign_bug = AssignBug.create!(assign_bugs_params)
    if @assign_bug.save
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
