class ChangeDataTypeForStatus < ActiveRecord::Migration[5.2]
  def change
    change_table :user_viewing_parties do |t|
      t.change :status, :string
    end
  end
end
