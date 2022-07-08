class AddHosttoViewingPartys < ActiveRecord::Migration[5.2]
  def change
    add_reference :viewing_parties, :host, foreign_key: { to_table: :users }
  end
end
