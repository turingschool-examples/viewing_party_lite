class CreateUserViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :user_viewing_parties do |t|
      t.references :viewing_party, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
