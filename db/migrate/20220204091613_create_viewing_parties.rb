class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.date :date
      t.string :start_time
      t.integer :length
      t.integer :movie_id
      t.integer :host_id

      t.timestamps
    end
  end
end
