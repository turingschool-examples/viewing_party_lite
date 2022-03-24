class AddTimestampToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :created_at, :datetime
    add_column :parties, :updated_at, :datetime
  end
end
