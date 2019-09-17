class PlaylistSong < ApplicationRecord
    belongs_to :playlist_song
    belongs_to :song
end
