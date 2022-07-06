class AddHostToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :host, :string
  end
end
