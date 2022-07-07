class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :user_id, :host_id
  end
end
