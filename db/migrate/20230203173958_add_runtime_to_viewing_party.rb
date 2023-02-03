class AddRuntimeToViewingParty < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :runtime, :integer
  end
end
