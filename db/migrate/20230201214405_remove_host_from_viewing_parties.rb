class RemoveHostFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :host
  end
end
