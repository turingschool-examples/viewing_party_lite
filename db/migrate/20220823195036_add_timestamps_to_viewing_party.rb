# frozen_string_literal: true

class AddTimestampsToViewingParty < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :created_at, :datetime
    add_column :viewing_parties, :updated_at, :datetime
  end
end
