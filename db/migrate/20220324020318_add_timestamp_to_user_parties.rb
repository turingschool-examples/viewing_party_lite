class AddTimestampToUserParties < ActiveRecord::Migration[5.2]
  def change
    add_column :user_parties, :created_at, :datetime
    add_column :user_parties, :updated_at, :datetime
  end
end
