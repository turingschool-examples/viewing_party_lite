class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date
      t.time :time
      t.integer :duration

      t.timestamps
    end
  end
end
