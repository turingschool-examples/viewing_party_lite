class CreatePartyGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :party_guests do |t|
      t.integer :guest_id
    end
  end
end
