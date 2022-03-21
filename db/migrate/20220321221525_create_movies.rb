class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :runtime
      t.text :summary
      t.integer :review_count
      t.string :image
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
