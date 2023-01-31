class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :duration
      t.datetime :when
    end
  end
end
