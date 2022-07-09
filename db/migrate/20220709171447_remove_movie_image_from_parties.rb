class RemoveMovieImageFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :movie_image, :string
  end
end
