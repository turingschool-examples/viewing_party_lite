class AddViewingPartyToPartyUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :party_users, :viewing_party, foreign_key: true
  end
end
