class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.date :date
      t.time :start_time
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
