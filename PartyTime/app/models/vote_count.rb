class VoteCount < ApplicationRecord
    belongs_to :playlist_song
    belongs_to :event
end
