# frozen_string_literal: true

class AddHostIdToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :host_id, :bigint
  end
end
