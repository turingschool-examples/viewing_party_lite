class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.string :runtime
      t.string :summary
      t.string :genre
      t.string :cast
      t.integer :total_reviews
      t.string :reviewers

      t.timestamps
    end
  end
end
