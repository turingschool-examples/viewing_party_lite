class AddStartTimeToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :start_time, :time
  end
end
