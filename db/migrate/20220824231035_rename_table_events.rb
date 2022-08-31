class RenameTableEvents < ActiveRecord::Migration[5.2]
  def change
    rename_table('events','movies')  
  end
end
