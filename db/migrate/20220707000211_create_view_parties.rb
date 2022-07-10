# frozen_string_literal: true

class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.integer :movie_api_id
      t.integer :duration
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
