class RemoveMovieFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :movie, :string
  end
end
