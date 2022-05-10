class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.interval :duration
      t.date :date
      t.time :start_time
      t.string :name
      t.integer :host_id

      t.timestamps
    end
  end
end
