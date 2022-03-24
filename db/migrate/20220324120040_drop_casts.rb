class DropCasts < ActiveRecord::Migration[5.2]
  def change
    drop_table :casts
  end
end
