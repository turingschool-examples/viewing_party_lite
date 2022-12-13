class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.string :password_confirmation
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
