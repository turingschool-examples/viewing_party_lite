# frozen_string_literal: true

class CreateUserViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_view_parties do |t|
      t.references :user, foreign_key: true
      t.references :view_party, foreign_key: true

      t.timestamps
    end
  end
end
