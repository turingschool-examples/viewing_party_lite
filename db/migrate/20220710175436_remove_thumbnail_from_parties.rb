class RemoveThumbnailFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :thumbnail
  end
end
