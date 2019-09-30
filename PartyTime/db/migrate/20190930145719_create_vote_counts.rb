class CreateVoteCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_counts do |t|
      t.integer :event_id
      t.integer :playlist_song_id

      t.timestamps
    end
  end
end
