class RemoveStartTimeFromParty < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :start_time, :time
  end
end
