class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :host_id
      t.integer :movie_id
      t.date :date
      t.time :start_time
      t.integer :length

      t.timestamps
    end
  end
end
