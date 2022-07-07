class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie
      t.datetime :date_time
      t.integer :duration

      t.timestamps
    end
  end
end
