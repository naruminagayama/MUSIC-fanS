class CreateFavorite2s < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite2s do |t|
      t.integer :customer_id
      t.integer :song_id

      t.timestamps
    end
  end
end
