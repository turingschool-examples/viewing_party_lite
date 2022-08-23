class AddUsersToViewParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :view_parties, :user, foreign_key: true
  end
end
