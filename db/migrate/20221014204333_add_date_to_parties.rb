class AddDateToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :date, :date
  end
end
