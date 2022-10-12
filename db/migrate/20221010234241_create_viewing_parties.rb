# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :host
      t.integer :duration
      t.integer :movie_id
      t.string :image_path
      t.string :movie_title
      t.datetime :start_time

      t.timestamps
    end
  end
end
