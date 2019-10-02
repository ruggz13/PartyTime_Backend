class PlaylistSong < ApplicationRecord
    belongs_to :playlist
    belongs_to :song
    has_many :vote_counts
end
