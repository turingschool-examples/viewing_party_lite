class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :movie, foreign_key: true
      t.integer :party_duration
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
