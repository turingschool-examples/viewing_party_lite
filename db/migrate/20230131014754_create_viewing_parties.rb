class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.datetime :date
      t.datetime :start_time
      t.integer :movie_id
      t.references :host
      t.timestamps
    end
  end
end
