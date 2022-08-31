class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :image_url, :string
    add_column :events, :title, :string
    add_column :events, :run_time, :integer
  end
end
