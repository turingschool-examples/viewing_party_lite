class RemoveHostedbyidFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :hosted_by_id, :integer
  end
end
