class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.string :duration
      t.time :time

      t.timestamps
    end
  end
end
