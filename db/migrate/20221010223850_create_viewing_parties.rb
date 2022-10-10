class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.string :movie_id
      t.integer :host_id
      t.integer :duration
      t.date :date
      t.time :start_time
      t.string :poster_path
      t.timestamps
    end
  end
end
