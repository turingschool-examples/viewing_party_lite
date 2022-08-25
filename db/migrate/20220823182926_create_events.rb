class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :duration
      t.datetime :day
      t.string :start_time

      t.timestamps
    end
  end
end
