class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.datetime :start_time
      t.integer :movie_id

      t.timestamps
    end
  end
end
