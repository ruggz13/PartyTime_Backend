class Event < ApplicationRecord
    belongs_to :playlist
    has_many :vote_counts
end
