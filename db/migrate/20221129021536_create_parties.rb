class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.date :day
      t.time :start_time
      t.string :movie_title

      t.timestamps
    end
  end
end
