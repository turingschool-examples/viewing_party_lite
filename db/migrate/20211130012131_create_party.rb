class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :movie_id
      t.integer :movie_duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
