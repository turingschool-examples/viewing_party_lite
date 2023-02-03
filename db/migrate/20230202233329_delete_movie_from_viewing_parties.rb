# frozen_string_literal: true

class DeleteMovieFromViewingParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :movie_id
  end
end
