class AddGoalsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :goals, :user, null: false, foreign_key: { to_table: :users }, index: true
  end
end
