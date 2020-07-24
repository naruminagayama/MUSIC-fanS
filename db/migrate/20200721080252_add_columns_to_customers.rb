class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string, null: false
    add_column :customers, :first_name, :string, null: false
    add_column :customers, :last_name_kana, :string, null: false
    add_column :customers, :first_name_kana, :string, null: false
    add_column :customers, :nickname, :string, null: false
    add_column :customers, :image_id, :string, null: false
  end
end