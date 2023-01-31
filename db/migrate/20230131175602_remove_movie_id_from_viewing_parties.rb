class RemoveMovieIdFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :movie_id
  end
end
