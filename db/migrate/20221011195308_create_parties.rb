class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.string :date
      t.string :start_time
      t.integer :movie_id # , default: nil

      t.timestamps
    end
  end
end
