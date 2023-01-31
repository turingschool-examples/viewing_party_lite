class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :summary
      t.string :cast
      t.float :vote
      t.integer :runtime

      t.timestamps
    end
  end
end
