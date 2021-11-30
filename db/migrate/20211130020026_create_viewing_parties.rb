class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.time :start_time
      t.integer :host_id

      t.timestamps
    end
  end
end
