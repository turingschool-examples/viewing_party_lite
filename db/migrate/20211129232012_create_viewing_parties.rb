class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_name
      t.integer :duration
      t.time :start_time
      t.references :user, foreign_key: true
    end
  end
end
