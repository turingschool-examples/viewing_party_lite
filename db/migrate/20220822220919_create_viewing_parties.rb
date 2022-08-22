class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.datetime :start_time
      t.integer :party_duration_minutes
      t.string :movie_title
      t.integer :movie_duration_minutes 
      t.timestamps
    end
  end
end
