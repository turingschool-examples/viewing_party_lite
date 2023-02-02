class AddDefaultToHostingInUserViewingParties < ActiveRecord::Migration[5.2]
  def change
    change_column :user_viewing_parties, :hosting, :boolean, default: false
  end
end
