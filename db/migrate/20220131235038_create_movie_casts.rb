class CreateMovieCasts < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_casts do |t|
      t.references :cast_member, foreign_key: true
      t.references :movie, foreign_key: true
      t.string :character_played

      t.timestamps
    end
  end
end
