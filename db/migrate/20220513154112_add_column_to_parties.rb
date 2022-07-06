class AddColumnToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :guests, :string, array: true, default: []
  end
end
