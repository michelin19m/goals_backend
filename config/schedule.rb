every 1.day, at: '10:00 am' do
  runner "Goal.where(notification_frequency: 'daily').find_each { |goal| NotifyUserJob.perform_later(goal.id) }"
end

every 1.week, at: 'Monday 10:00 am' do
  runner "Goal.where(notification_frequency: 'weekly').find_each { |goal| NotifyUserJob.perform_later(goal.id) }"
end

every 1.month, at: 'Monday 10:00 am' do
  runner "Goal.where(notification_frequency: 'monthly').find_each { |goal| NotifyUserJob.perform_later(goal.id) }"
end