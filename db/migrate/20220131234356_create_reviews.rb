class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :movie, foreign_key: true
      t.string :reviewer_name
      t.string :review_body

      t.timestamps
    end
  end
end
