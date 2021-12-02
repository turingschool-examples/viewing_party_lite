# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.integer :duration_of_party
      t.time :start_time
      t.date :day
      t.string :title
      t.string :poster
      t.references :user, foreign_key: true
    end
  end
end
