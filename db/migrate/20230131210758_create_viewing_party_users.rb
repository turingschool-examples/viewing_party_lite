class CreateViewingPartyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_party_users do |t|
      t.references :users, foreign_key: true
      t.references :viewing_parties, foreign_key: true
      t.boolean :hosting

      t.timestamps
    end
  end
end
