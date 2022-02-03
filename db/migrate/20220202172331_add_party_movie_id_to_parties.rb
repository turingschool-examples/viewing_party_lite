class AddPartyMovieIdToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :party_movie_id, :integer
  end
end
