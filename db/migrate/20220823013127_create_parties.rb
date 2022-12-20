class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date
      t.string :start_time
      t.integer :movie_id
      t.string :title
      t.string :poster

      t.timestamps
    end
  end
end
