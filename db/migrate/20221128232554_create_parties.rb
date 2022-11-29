class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.datetime :date
      t.string :start_time
      t.string :movie_title
      t.integer :duration

      t.timestamps
    end
  end
end
