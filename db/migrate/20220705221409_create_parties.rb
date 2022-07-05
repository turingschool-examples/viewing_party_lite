class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.string :date
      t.string :movie
      t.string :host
      t.string :movie_image

      t.timestamps
    end
  end
end
