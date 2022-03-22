class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :day
      t.time :start_time
      t.integer :duration
    end
  end
end
