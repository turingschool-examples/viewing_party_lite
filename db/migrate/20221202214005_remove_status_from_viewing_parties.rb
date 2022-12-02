class RemoveStatusFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :status, :boolean
  end
end
