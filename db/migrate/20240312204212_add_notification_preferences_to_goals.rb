class AddNotificationPreferencesToGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :goals, :notify_me, :boolean, default: false
    add_column :goals, :notification_frequency, :string
  end
end
