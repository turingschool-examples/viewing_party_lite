# frozen_string_literal: true

class DeleteMovies < ActiveRecord::Migration[5.2]
  def change
    drop_table :movies
  end
end
