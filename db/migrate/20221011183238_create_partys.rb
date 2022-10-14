# frozen_string_literal: true

class CreatePartys < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date
      t.integer :duration
      t.integer :movie_id
      t.time :start_time
      t.integer :host_id

      t.timestamps
    end
  end
end
