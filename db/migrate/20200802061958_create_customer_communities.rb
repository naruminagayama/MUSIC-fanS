class CreateCustomerCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_communities do |t|

      t.timestamps
    end
  end
end
