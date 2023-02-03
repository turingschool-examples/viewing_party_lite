class AddTitleAndPosterPathToViewingParty < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :title, :string
    add_column :viewing_parties, :poster_path, :string
  end
end
