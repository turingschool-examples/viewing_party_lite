class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :user, foreign_key: true
      t.references :viewing_party, foreign_key: true

      t.timestamps
    end
  end
end
