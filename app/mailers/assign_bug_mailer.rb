class AssignBugMailer < ApplicationMailer
  default from: 'sanjubasnet@gmail.com'

  def assign_bug_developer(user,bug)
    @user = user
    @bug = bug
    @url = 'http://127.0.0.1:3000/bugs'
    mail(to: @user.email, subject: 'new bug is assigned to you')
  end
end
