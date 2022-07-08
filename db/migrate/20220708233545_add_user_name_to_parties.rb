class AddUserNameToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :user_name, :string
  end
end
