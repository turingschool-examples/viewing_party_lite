class CreatePartyPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :party_people do |t|
      t.references :person, foreign_key: true
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
