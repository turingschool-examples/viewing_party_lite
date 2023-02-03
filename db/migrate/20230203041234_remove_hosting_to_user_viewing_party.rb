class RemoveHostingToUserViewingParty < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_viewing_parties, :status
  end
end
