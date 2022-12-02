# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :duration
      t.date :date
      t.time :time
      t.integer :host_id

      t.timestamps
    end
  end
end
