class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :genre_id
      t.string :name
      t.text :detail
      t.string :image_id
      t.string :sale_year
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
