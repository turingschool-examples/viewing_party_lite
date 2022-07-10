class AddHostIdToViewParties < ActiveRecord::Migration[5.2]
  def change
    add_column :view_parties, :host_id, :integer
  end
end
