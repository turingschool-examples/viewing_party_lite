class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.integer :run_time
      t.string :poster_file_path
      t.string :summary
      t.string :genres

      t.timestamps
    end
  end
end
