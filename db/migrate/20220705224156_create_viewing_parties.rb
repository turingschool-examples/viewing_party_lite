class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.integer :duration
      t.string :attendees
      t.date :start_date
      t.time :start_time
      t.string :image
      t.integer :host_id
    end
  end
end
