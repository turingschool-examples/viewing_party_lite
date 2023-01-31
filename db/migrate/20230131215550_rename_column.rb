class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_party_users, :viewing_parties_id, :viewing_party_id
  end
end
