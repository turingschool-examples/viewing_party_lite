class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :title
      t.string :date
      t.integer :duration
      t.references :user
      t.integer :movie_id

      t.timestamps
    end
  end
end
