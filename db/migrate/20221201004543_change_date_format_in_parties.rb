class ChangeDateFormatInParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :start_time
    add_column :parties, :start_time, :datetime
  end
end

