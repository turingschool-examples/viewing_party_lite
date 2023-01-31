class DropMovies < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :viewing_parties, column: :movie_id
    drop_table :movies
  end
end
