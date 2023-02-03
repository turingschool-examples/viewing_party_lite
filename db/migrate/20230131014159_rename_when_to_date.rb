class RenameWhenToDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :when, :event_date
  end
end
