class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date
      t.integer :duration
      t.time :start_time
      t.string :movie
      t.integer :host
      t.integer :movie_id

      t.timestamps
    end
  end
end
