class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :date
      t.string :start_time
      t.string :movie_title
      t.integer :duration

      t.timestamps
    end
  end
end
