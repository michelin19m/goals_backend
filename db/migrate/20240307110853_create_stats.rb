class CreateStats < ActiveRecord::Migration[7.1]
  def change
    create_table :stats do |t|

      t.timestamps
    end
  end
end
