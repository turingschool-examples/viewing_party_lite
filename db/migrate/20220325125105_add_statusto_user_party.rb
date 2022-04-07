class AddStatustoUserParty < ActiveRecord::Migration[5.2]
  def change
    add_column :user_parties, :status, :string, default: "0"
    add_column :users, :password_digest, :string
  end
end
