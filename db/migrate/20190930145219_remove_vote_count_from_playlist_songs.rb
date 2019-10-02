class RemoveVoteCountFromPlaylistSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlist_songs, :vote_count, :integer
  end
end
