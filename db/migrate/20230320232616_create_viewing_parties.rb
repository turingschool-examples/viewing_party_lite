class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :duration
      t.integer :host_id
      t.date :party_date
      t.time :party_time
      t.integer :movie_id

      t.timestamps
    end
  end
end
