class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :api_id
      t.string :image_url
      t.string :title
    end
  end
end
