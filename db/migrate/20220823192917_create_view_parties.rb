class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
