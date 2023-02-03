class RenameDateTimeInViewingParties < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :date_time, :date
  end
end
