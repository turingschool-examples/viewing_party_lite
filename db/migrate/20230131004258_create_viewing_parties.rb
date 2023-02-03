class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.datetime :when
      t.datetime :start_time
      t.timestamps
    end
  end
end
