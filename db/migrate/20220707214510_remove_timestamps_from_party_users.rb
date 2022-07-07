class RemoveTimestampsFromPartyUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :party_users, :timestamps, :datetime
  end
end
