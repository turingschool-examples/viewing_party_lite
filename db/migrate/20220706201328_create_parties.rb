# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :thumbnail
      t.string :title
      t.datetime :date
      t.datetime :start
      t.integer :duration
      t.timestamps
    end
  end
end
