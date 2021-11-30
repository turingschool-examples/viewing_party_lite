class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :creator_id
      t.integer :movie_id
      t.integer :length
      t.datetime :start_time

      t.timestamps
    end
  end
end
