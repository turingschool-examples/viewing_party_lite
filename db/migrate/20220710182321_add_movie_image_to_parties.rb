class AddMovieImageToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_image, :string
    add_column :parties, :string, :string
  end
end
