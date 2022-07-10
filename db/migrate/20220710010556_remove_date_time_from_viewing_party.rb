class RemoveDateTimeFromViewingParty < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :date_time, :datetime
    add_column :viewing_parties, :date, :date
    add_column :viewing_parties, :start_time, :time
  end
end
