class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :host_id
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
