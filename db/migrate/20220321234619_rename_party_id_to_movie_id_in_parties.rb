class RenamePartyIdToMovieIdInParties < ActiveRecord::Migration[5.2]
  def up
    rename_column :parties, :party_id, :movie_id
  end
end
