class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.datetime :event_start
      t.integer :movie_id

      t.timestamps
    end
  end
end
