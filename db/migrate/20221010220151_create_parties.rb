class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date
      t.string :duration
      t.time :start_time

      t.timestamps
    end
  end
end
