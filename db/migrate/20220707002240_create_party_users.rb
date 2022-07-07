class CreatePartyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :party_users do |t|
      t.references :parties, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
