class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.datetime :date
      t.string :time
      t.integer :movie_id
      t.integer :duration

      t.timestamps
    end
  end
end
