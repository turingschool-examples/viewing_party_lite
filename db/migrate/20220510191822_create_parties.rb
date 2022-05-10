class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user
      t.integer :duration
      t.datetime :when
      t.datetime :start_time

      t.timestamps
    end
  end
end
