class AddRunTimeToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :run_time, :integer
  end
end
