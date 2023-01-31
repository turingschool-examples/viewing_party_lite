class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :movie, foreign_key: true
      t.integer :duration
      t.string :when

      t.timestamps
    end
  end
end
