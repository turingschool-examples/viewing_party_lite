class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :title
      t.integer :duration
      t.time :start_time
    end
  end
end
