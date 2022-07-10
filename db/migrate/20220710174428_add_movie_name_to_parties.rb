# frozen_string_literal: true

class AddMovieNameToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_name, :string
  end
end
