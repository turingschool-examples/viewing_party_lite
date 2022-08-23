class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.datetime :date
      t.datetime :start_time
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
