class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :description
      t.string :short_desc
      t.date :target_date
      t.integer :target_value, default: 100
      t.integer :starting_value, default: 0

      t.timestamps
    end
  end
end
