# frozen_string_literal: true

class CreatePartyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :party_users do |t|
      t.references :user, foreign_key: true
      t.references :party, foreign_key: true
      t.boolean :host

      t.timestamps
    end
  end
end
