class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.date :date
      t.integer :duration
      t.time :start_time
      t.integer :host_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
