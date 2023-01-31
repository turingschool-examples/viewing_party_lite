class RemoveUserIdFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :user_id
  end
end
