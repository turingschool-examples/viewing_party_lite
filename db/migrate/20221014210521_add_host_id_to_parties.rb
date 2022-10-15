class AddHostIdToParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :parties, :host, null: true, index: true, foreign_key: { to_table: :users }
  end
end
