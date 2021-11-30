class RemoveInviteeidFromPartyInvitees < ActiveRecord::Migration[5.2]
  def change
    remove_column :party_invitees, :invitee_id, :integer
  end
end
