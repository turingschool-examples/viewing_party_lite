class AddHostIdToPartyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :party_users, :host_id, :integer
  end
end
