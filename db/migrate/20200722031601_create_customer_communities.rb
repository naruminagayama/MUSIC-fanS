class CreateCustomerCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_communities do |t|
      t.integer :customer_id
      t.integer :community_id

      t.timestamps
    end
  end
end
