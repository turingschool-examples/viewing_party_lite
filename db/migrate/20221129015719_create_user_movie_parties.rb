# frozen_string_literal: true

class CreateUserMovieParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_movie_parties do |t|
      t.references :user, foreign_key: true
      t.references :movie_party, foreign_key: true
      t.integer :status
    end
  end
end
