class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.references :parties, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
