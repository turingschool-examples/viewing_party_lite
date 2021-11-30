class AddUserToPartyInvitees < ActiveRecord::Migration[5.2]
  def change
    add_reference :party_invitees, :user, foreign_key: true
  end
end
