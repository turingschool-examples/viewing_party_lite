# frozen_string_literal: true

class CreateMovieParties < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_parties do |t|
      t.string :movie_title
      t.integer :duration
      t.datetime :start_time
      t.integer :movie_id

      t.timestamps
    end
  end
end
