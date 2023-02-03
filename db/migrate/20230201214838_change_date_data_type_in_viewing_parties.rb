class ChangeDateDataTypeInViewingParties < ActiveRecord::Migration[5.2]
  def change
    change_column :viewing_parties, :date, :date
  end
end
