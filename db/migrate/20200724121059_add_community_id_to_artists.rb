class AddCommunityIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :community_id, :integer
  end
end
