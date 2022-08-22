class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.integer :host_id
      t.text :movie_details
      t.datetime :event_date
      t.integer :party_duration

      t.timestamps
    end
  end
end
