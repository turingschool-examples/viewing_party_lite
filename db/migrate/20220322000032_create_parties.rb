# frozen_string_literal: true

# Parties model migration
class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.integer :duration_time
      t.date :start_date
      t.time :start_time
      t.string :movie_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
