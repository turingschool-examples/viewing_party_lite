class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :day
      t.time :start_time
      t.integer :duration
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
