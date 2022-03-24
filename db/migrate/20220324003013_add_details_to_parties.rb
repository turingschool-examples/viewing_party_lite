class AddDetailsToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_name, :string
  end
end
