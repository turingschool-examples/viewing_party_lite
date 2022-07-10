class AddColumnToViewParties < ActiveRecord::Migration[5.2]
  def change
    add_column :view_parties, :movie_image_path, :string
    add_column :view_parties, :movie_title, :string
  end
end
