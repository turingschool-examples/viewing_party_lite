# frozen_string_literal: true

class CreateViewParty < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.integer :movie_id
      t.string :movie_name
      t.integer :duration
      t.datetime :datetime

      t.timestamps
    end
  end
end
