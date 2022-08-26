class RenameColumnOnEventUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column(:event_users, :event_id, :movie_id)
  end
end
