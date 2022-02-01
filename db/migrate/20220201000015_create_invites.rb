class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :user, foreign_key: true
      t.references :view_party, foreign_key: true

      t.timestamps
    end
  end
end
