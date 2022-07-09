class AddMovieTitleToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_title, :string
  end
end
