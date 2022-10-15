class AddMoviePosterToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_poster_url, :text
  end
end
