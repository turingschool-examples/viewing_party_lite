class AddStatusToUserViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :user_viewing_parties, :status, :boolean
  end
end
