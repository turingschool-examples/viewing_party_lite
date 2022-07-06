# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :date
      t.integer :movie_id
      t.integer :duration
      t.string :start_time

      t.timestamps
    end
  end
end
