class UserMailer < ApplicationMailer
  def stat_reminder_email
    @goal = params[:goal]
    @user = @goal.user
    mail(to: @user.email, subject: 'Reminder to add your stats')
  end
end