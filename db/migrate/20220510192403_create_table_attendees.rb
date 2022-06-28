# frozen_string_literal: true

class CreateTableAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :user, foreign_key: true
      t.references :party, foreign_key: true
    end
  end
end
