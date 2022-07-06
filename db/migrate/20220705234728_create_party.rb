class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.time :duration
      t.date :date
      t.time :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
