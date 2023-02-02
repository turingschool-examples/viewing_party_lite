class DeleteHostingColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :hosting
  end
end
