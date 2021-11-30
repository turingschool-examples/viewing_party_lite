class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.integer :runtime

      t.timestamps
    end
  end
end
