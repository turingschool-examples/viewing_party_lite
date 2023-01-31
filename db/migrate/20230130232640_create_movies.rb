class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :vote_average
      t.integer :runtime
      t.string :summary

      t.timestamps
    end
  end
end
