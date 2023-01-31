class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :when, :party_date
  end
end
