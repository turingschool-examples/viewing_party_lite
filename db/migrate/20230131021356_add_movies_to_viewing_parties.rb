class AddMoviesToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :viewing_parties, :movie, foreign_key: true
  end
end
