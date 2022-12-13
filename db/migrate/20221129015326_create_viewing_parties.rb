# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.integer :duration
      t.date :date
      t.time :start_time
      t.boolean :status

      t.timestamps
    end
  end
end
