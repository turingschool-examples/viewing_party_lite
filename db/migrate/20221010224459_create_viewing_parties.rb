class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.datetime :date
      t.integer :movie_id
      t.has_many :user_viewing_parties

      t.timestamps
    end
  end
end
