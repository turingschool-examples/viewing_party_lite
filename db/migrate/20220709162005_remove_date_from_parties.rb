class RemoveDateFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :date, :string
  end
end
