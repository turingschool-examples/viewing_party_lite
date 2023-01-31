class AddHostToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :host, :integer
  end
end
