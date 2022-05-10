class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :event_date
      t.string :duration
      t.time :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
