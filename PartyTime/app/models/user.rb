class User < ApplicationRecord
    has_many :playists

    # def access_token_expired?
    #     (Time.now - self.updated_at) > 3300
    # end
end
