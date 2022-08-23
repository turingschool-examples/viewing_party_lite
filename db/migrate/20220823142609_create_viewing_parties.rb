class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.datetime :date
      t.integer :host_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
