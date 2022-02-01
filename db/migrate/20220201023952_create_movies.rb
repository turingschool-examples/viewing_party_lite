class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :vote_average
      t.integer :runtime
      t.string :genre
      t.string :summary
      t.string :cast_members
      t.integer :total_review_count
      t.string :review_information

      t.timestamps
    end
  end
end
