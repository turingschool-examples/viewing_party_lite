class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.date :date
      t.time :time
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
