class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :vote_average
      t.integer :run_time
      t.string :genre
      t.string :summary

      t.timestamps
    end
  end
end
