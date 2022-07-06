class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.time :start_time
      t.date :date
      t.integer :duration
      t.integer :movie_id

      t.timestamps
    end
  end
end
