class AddHostingToUserViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :user_viewing_parties, :hosting, :boolean
  end
end
