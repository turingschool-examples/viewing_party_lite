class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.integer :duration
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
