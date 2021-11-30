class CreateMovieParties < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_parties do |t|
      t.references :party, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
