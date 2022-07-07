class AddTimestampsToPartyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :party_users, :timestamps, :datetime
  end
end
