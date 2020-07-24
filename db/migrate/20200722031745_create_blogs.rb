class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :customer_id
      t.string :title
      t.string :image_id
      t.text :content

      t.timestamps
    end
  end
end
