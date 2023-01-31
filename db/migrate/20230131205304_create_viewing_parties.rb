class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.integer :duration
      t.date :start_day
      t.time :start_time

      t.timestamps
    end
  end
end
