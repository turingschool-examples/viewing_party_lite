class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.integer :host_id
      t.integer :duration
      t.string :start_time
      t.string :date_time

      t.timestamps
    end
  end
end
