class ChangeParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :date, :date
  end

  def change
    change_column :parties, :time, :string
  end
end
