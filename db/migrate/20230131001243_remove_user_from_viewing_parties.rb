class RemoveUserFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :viewing_parties, :users
  end
end
