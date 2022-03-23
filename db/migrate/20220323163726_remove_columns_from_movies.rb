class RemoveColumnsFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :title, :string
    remove_column :movies, :rating, :integer
    remove_column :movies, :runtime, :string
    remove_column :movies, :summary, :text
    remove_column :movies, :review_count, :integer
    remove_column :movies, :image, :string
    remove_reference :movies, :genre, foreign_key: true
    add_column :movies, :api_id, :integer
  end
end
