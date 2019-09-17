class CreatePlaylistSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_songs do |t|
      t.integer :song_id
      t.integer :playlist_id
      t.integer :vote_count
      t.integer :queue

      t.timestamps
    end
  end
end
