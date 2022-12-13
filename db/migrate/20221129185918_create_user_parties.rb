class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.integer :user_status, default: 1
      t.references :user, foreign_key: true
      t.references :viewing_party, foreign_key: true

      t.timestamps
    end
  end
end
