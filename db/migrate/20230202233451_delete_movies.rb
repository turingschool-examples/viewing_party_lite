class DeleteMovies < ActiveRecord::Migration[5.2]
  def change
    drop_table :movies
  end
end
