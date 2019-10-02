class User < ApplicationRecord
    has_many :playlists
    has_many :events, through: :playlists
end
