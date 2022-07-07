class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :host
      t.string :movie_name
      t.integer :movie_id
      t.date :date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
