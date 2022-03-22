class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.datetime :date
      t.datetime :start_time

      t.timestamps
    end
  end
end
