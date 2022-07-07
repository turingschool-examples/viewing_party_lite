class RevertChange < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :host_id, :user_id
  end
end
