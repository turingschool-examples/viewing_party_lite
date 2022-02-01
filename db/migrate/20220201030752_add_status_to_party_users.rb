class AddStatusToPartyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :party_users, :status, :integer, default:0
  end
end
