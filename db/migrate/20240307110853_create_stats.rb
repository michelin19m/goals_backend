class CreateStats < ActiveRecord::Migration[7.1]
  def change
    create_table :stats do |t|
      t.references :goal, null: false, foreign_key: true
      t.date :recorded_date
      t.integer :progress_value
      t.string :notes

      t.timestamps
    end
  end
end
