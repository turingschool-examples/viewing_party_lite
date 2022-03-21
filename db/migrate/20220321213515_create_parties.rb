class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :host_id
      t.integer :party_id
      t.integer :length
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
