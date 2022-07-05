class CreateUserViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_viewing_parties do |t|
      t.references :users, foreign_key: true
      t.references :viewing_parties, foreign_key: true
      t.timestamps
    end
  end
end
