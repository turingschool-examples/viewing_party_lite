class ChangeWhenFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :when, :date_time
  end
end
