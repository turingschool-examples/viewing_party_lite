class AddHostIdToViewingParty < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :host_id, :integer
  end
end
