# frozen_string_literal: true

class ChangeViewParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :view_parties, :movie_details, :text
    add_column :view_parties, :movie_title, :string
    add_column :view_parties, :duration, :integer
    add_column :view_parties, :poster_path, :string
  end
end
