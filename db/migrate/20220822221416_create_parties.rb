class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.datetime :date
      t.datetime :start_time
      t.integer :duration
      t.integer :movie_id
      t.timestamps
    end
  end
end
