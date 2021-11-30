class DropMovieParties < ActiveRecord::Migration[5.2]
  def change
    drop_table :movie_parties
  end
end
