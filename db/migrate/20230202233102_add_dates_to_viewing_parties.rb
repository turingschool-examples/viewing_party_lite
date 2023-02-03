# frozen_string_literal: true

class AddDatesToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :party_date, :date
    add_column :viewing_parties, :party_time, :time
  end
end
