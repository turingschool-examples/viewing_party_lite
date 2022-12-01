class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.datetime :when
      t.datetime :start_time
      t.references :user
      t.timestamps
    end
  end
end
