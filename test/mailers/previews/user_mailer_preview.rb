# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/stat_reminder_email
  def stat_reminder_email
    UserMailer.stat_reminder_email
  end

end
