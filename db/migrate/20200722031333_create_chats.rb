class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :customer_id
      t.integer :community_id
      t.text :message

      t.timestamps
    end
  end
end
