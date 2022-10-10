class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.date :date
      t.time :start_time
      t.integer :movie_id
      t.references :host, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
