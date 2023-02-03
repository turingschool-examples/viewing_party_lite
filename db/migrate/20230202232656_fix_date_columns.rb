# frozen_string_literal: true

class FixDateColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewing_parties, :party_date
  end
end
