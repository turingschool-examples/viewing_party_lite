class AddColumnToUserParties < ActiveRecord::Migration[5.2]
  def change
    add_column :user_parties, :host, :boolean
  end
end
