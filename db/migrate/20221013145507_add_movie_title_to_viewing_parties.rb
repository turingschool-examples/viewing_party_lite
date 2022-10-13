class AddMovieTitleToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :movie_title, :string
  end
end
