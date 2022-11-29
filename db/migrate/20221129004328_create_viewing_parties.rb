class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.integer :duration
      t.date :date
      t.time :time
      t.string :movie_title

      t.timestamps
    end
  end
end
