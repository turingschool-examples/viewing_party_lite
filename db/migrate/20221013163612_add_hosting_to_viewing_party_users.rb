class AddHostingToViewingPartyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_party_users, :hosting, :boolean, default: false
  end
end
