class DeleteHostColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :host
  end
end
