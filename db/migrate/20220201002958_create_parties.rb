class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :host
      t.integer :duration
      t.date :day
      t.time :start_time
      t.integer :movie_id
      t.string :title
      t.string :poster_path
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
