class NotifyUserJob < ApplicationJob
  queue_as :default

  def perform(goal_id)
    goal = Goal.find_by(id: goal_id)
    return unless goal&.notify_me?

    UserMailer.with(goal: goal).stat_reminder_email.deliver_later
  end
end
