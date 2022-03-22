class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.string :date
      t.string :start_time

      t.timestamps
    end
  end
end
