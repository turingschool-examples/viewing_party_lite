# frozen_string_literal: true

class AddColumnToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_poster, :string
  end
end
