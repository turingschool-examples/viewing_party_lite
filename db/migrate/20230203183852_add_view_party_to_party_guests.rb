class AddViewPartyToPartyGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :party_guests, :view_party, foreign_key: true
  end
end
