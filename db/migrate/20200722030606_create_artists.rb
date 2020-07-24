class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :detail
      t.string :image_id
      t.string :formation_yeah
      t.boolean :is_active

      t.timestamps
    end
  end
end
