class DropActors < ActiveRecord::Migration[5.2]
  def change
    drop_table :actors
  end
end
