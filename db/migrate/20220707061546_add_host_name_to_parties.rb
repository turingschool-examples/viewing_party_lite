class AddHostNameToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :host_name, :string
  end
end
