class RenameAnotherColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_party_users, :users_id, :user_id
  end
end
