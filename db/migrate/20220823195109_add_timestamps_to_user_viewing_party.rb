class AddTimestampsToUserViewingParty < ActiveRecord::Migration[5.2]
  def change
    add_column :user_viewing_parties, :created_at, :datetime
    add_column :user_viewing_parties, :updated_at, :datetime
  end
end
