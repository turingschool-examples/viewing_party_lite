class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.date :date
      t.string :duration
      t.time :start_time
      t.references :movies, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
