class RemoveSpotifyIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :spotify_id, :integer
  end
end
