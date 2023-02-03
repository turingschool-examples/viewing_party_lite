class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.references :user, foreign_key: true
      t.date :day
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
