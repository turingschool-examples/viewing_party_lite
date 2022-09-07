class RemoveViewingPartiesFromPartyUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :party_users, :viewing_parties, foreign_key: true
  end
end
