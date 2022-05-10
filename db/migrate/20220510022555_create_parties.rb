class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :start_time
      t.integer :date
      t.integer :length
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
