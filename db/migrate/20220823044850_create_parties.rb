class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie
      t.date :date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
